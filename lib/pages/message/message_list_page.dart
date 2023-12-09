import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_template/config/constant.dart';
import 'package:flutter_template/core/utils/date_format_util.dart';
import 'package:flutter_template/core/widget/common_widget.dart';
import 'package:flutter_template/core/widget/custom_app_bar.dart';
import 'package:flutter_template/core/widget/list_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../model/messge_model.dart';

/// 消息列表页面
class MessageListPage extends StatefulWidget {
  const MessageListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {

  /// 每页显示的条数
  int pageSize = 10;
  /// 页数
  int pageNumber = 1;
  /// 是否允许上拉
  bool _enablePullUp = true;
  /// listview数据源
  List<MessageModel> messageList = [];
  /// 刷新加载控制器
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _loadData(true);
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context, title: '消息列表'),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 1)
        ),
        child: Column(
          children: [
            CommonWidget.searchWidget(callBack: (){
              print("点击了搜索");
            }),
            Expanded(
                flex: 1,
                child: listRefresh(_refreshController, messageList.length, _itemMessage,enablePullUp: _enablePullUp, onRefresh: () => _loadData(true), onLoading: () => _loadData(false))
            ),
          ],
        ),
      ),
    );
  }

  _itemMessage(int index){
    MessageModel messageModel = messageList[index];
    return Container(
      height: 270.w,
      padding: EdgeInsets.only(left: Constant.paddingLeftRight, right: Constant.paddingLeftRight),
      margin: EdgeInsets.only(top: 20.w, left: Constant.paddingLeftRight, right: Constant.paddingLeftRight),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w)
      ),
      child: InkWell(
        onTap: (){
          Get.toNamed("/message_detail_page", arguments: messageModel.id);
        },
        child: Column(
          children: [
            /// 标题
            SizedBox(
              height: 80.w,
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(146, 176, 255, 1),
                        borderRadius: BorderRadius.circular(20.w)
                    ),
                    child: Icon(Icons.assessment_outlined, size: 20.w, color: Colors.white,),
                  ),
                  Container(
                    width: 500.w,
                    margin: EdgeInsets.only(left: 10.w),
                    child: Text(messageModel.title??"", maxLines: 1, style: TextStyle(fontSize: 26.sp, overflow: TextOverflow.ellipsis,color: const Color.fromRGBO(48, 49, 51, 0.9)),),
                  ),
                  const Expanded(child: Text("")),
                  SizedBox(
                    width: 120.w,
                    child: Text(DateFormatUtil.formatLocalmmdd(messageModel.createTime??DateTime.now()), maxLines: 1, style: TextStyle(fontSize: 26.sp, overflow: TextOverflow.ellipsis, color: Constant.colorGrey),),
                  ),
                ],
              ),
            ),
            CommonWidget.dividerWidget(),
            /// 内容
            Container(
              height: 80.w,
              margin: EdgeInsets.only(top: 20.w, bottom: 20.w),
              child: Text("  ${messageModel.content}",  maxLines: 2, style: TextStyle(color: const Color.fromRGBO(80, 82, 86, 1), fontSize: 26.sp, overflow: TextOverflow.ellipsis),),
            ),
            CommonWidget.dividerWidget(),
            /// 查看次数
            Container(
              padding: EdgeInsets.only(top: 20.w),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.visibility_outlined, size: 30.w, color: Constant.colorGrey,),
                      Text(" ${messageModel.lookNum}", style: TextStyle(fontSize: 26.sp, color: Constant.colorGrey,),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Row(
                      children: [
                        Icon(Icons.share_outlined, size: 30.w, color: Constant.colorGrey),
                        Text(" ${messageModel.likesNum}", style: TextStyle(fontSize: 26.sp, color: Constant.colorGrey,),),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 加载数据
  _loadData(final bool isRefresh) async {
    setState(() {
      pageNumber = isRefresh ? 1 : pageNumber + 1;
    });

    int totalNum = 35;
    List<MessageModel> temp = [];
    int startNumber = pageSize * (pageNumber - 1);
    int endNumber = pageSize * pageNumber;
    endNumber = endNumber > totalNum ? totalNum : endNumber;
    Random random = Random();
    for(int i = startNumber; i < endNumber; i++){
      temp.add(MessageModel(
          id: random.nextInt(100).toString(),
          title: "用户分享内容到社交媒体或好生活_${i}_历史见证壮阔的行进。2021年我们党隆重庆祝成立100周年，开启了全面建设社会主义现代化国家新征程。",
          createTime: DateTime.now(),
          send: "发送人_$i",
          receiver: "接收人_$i",
          content: "在常见的社交分享组件中，微信（微信好友和朋友圈）、微博、QQ（QQ好友和QQ空间）是三大主要平台我们要合理利用这三个平台_$i",
          lookNum: random.nextInt(100),
          likesNum: random.nextInt(100)));
    }

    setState(() {
      _enablePullUp = messageList.length < totalNum;
      if (isRefresh) {
        messageList.clear();
        messageList.addAll(temp);
        _refreshController.refreshCompleted();
      }else{
        if (mounted) {
          messageList.addAll(temp);
        }
        _refreshController.loadComplete();
      }
    });
  }

}

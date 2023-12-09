import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/toast.dart';
import 'package:flutter_template/core/widget/common_widget.dart';
import 'package:flutter_template/core/widget/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 消息页面
class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: '消息'),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 1)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonWidget.searchWidget(callBack: (val){
              ToastUtils.toast("点击了搜索：$val");
            }),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: listMessage(),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  static List<Widget> listMessage(){
    List<Widget> list = [];
    /// 通知公告
    list.add(CommonWidget.listTile(title: "通知公告", desc: "关于元旦放假的通知", trailingTitle: "12:35",
        leading: Icon(Icons.campaign_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),
        leadingBackgroundColor: const Color.fromRGBO(88, 202, 147, 1), tipNum: '2',
        callBack: (){
          Get.toNamed("/message_list_page");
        }));
    /// 新闻动态
    list.add(CommonWidget.listTile(title: "新闻动态", desc: "神十三航天员圆满完成出仓任务", trailingTitle: "09:07",
        leading: Icon(Icons.newspaper_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),
        leadingBackgroundColor: const Color.fromRGBO(79, 119, 237, 1), tipNum: '1',
        callBack: (){
          Get.toNamed("/message_list_page");
        }));
    /// 日常办公
    list.add(CommonWidget.listTile(title: "日常办公", desc: "王梓涵提交的'请假申请'待你审批", trailingTitle: "11月07日",
        leading: Icon(Icons.notifications_none_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),
        leadingBackgroundColor: const Color.fromRGBO(243, 86, 67, 1), callBack: (){
          Get.toNamed("/message_list_page");
        }));
    /// 网上报销
    list.add(CommonWidget.listTile(title: "网上报销", desc: "吴天祥提交的'差旅费报销'待你审批", trailingTitle: "11月06日",
        leading: Icon(Icons.money_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),
        leadingBackgroundColor: const Color.fromRGBO(255, 198, 10, 1), callBack: (){
          Get.toNamed("/message_list_page");
        }));
    /// 我的邮件
    list.add(CommonWidget.listTile(title: "我的邮件", desc: "邮件提醒：15封新邮件未读", trailingTitle: "11月06日",
        leading: Icon(Icons.email_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),
        leadingBackgroundColor: const Color.fromRGBO(79, 119, 237, 1), callBack: (){
          Get.toNamed("/message_list_page");
        }));
    return list;
  }

}

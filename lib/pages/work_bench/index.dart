import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/widget/common_widget.dart';
import 'package:flutter_template/core/widget/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constant.dart';
import '../../core/widget/nk_swiper_pagination.dart';

///工作台页面
class WorkBench extends StatefulWidget {
  const WorkBench({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WorkBenchState();
}

class _WorkBenchState extends State<WorkBench> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: '工作台'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: Constant.paddingLeftRight, right: Constant.paddingLeftRight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              rotationChart(),
              commonFunctions(),
              dailyOffice(),
              financialReimbursement()
            ],
          ),
        ),
      ),
    );
  }

  /// 轮播图
  static Widget rotationChart(){
    List<String> imageList = [
      "https://static.runoob.com/images/demo/demo1.jpg",
      "https://static.runoob.com/images/demo/demo2.jpg",
      "https://static.runoob.com/images/demo/demo3.jpg",
      "https://static.runoob.com/images/demo/demo4.jpg",
    ];
    return SizedBox(
      height: 260.w,
      child: Swiper(
          itemBuilder: (context, index){
            // 配置图片地址
            return Image.network(imageList[index],fit: BoxFit.fill,);
          },
          // 配置图片数量
          itemCount: imageList.length ,
          // 底部分页器
          pagination: NKSwiperPagination(),
          // 无限循环
          loop: true,
          // 自动轮播
          autoplay: true,
      ),
    );
  }

  /// 常用功能
  static Widget commonFunctions(){
    List<Widget> list = [];
    /// 请假申请
    list.add(CommonWidget.workBenchIcon(title: "请假申请", backgroundColor: const Color.fromRGBO(239, 142, 53, 1),
        icon: Icon(Icons.holiday_village_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 合同申请
    list.add(CommonWidget.workBenchIcon(title: "合同申请", backgroundColor: const Color.fromRGBO(79, 119, 237, 1),
      icon: Icon(Icons.book_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 出差申请
    list.add(CommonWidget.workBenchIcon(title: "出差申请", backgroundColor: const Color.fromRGBO(88, 202, 147, 1),
      icon: Icon(Icons.airplane_ticket_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 日报
    list.add(CommonWidget.workBenchIcon(title: "日报", backgroundColor: const Color.fromRGBO(255, 198, 10, 1),
      icon: Icon(Icons.event_note_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 邮件
    list.add(CommonWidget.workBenchIcon(title: "邮件", backgroundColor: const Color.fromRGBO(79, 119, 237, 1),
      icon: Icon(Icons.email_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 会议室
    list.add(CommonWidget.workBenchIcon(title: "会议室", backgroundColor: const Color.fromRGBO(235, 81, 107, 1),
      icon: Icon(Icons.meeting_room_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 添加常用
    list.add(CommonWidget.workBenchIcon(title: "添加常用", backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      icon: Icon(Icons.add , color: const Color.fromRGBO(144, 148, 157, 1), size: 50.w,),));
    return SizedBox(
      height: 400.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
            child: const Text("常用应用"),
          ),
          Wrap(
            spacing: 80.w,
            children: list,
          )
        ],
      ),
    );
  }

  /// 日常办公
  static Widget dailyOffice(){
    List<Widget> list = [];
    /// 用车
    list.add(CommonWidget.workBenchIcon(title: "用车", backgroundColor: const Color.fromRGBO(79, 119, 237, 1),
      icon: Icon(Icons.directions_car_filled_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 加班
    list.add(CommonWidget.workBenchIcon(title: "加班", backgroundColor: const Color.fromRGBO(88, 202, 147, 1),
      icon: Icon(Icons.access_time_filled_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 考勤
    list.add(CommonWidget.workBenchIcon(title: "考勤", backgroundColor: const Color.fromRGBO(255, 198, 10, 1),
      icon: Icon(Icons.calendar_month_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 耗材
    list.add(CommonWidget.workBenchIcon(title: "耗材", backgroundColor: const Color.fromRGBO(79, 119, 237, 1),
      icon: Icon(Icons.local_print_shop_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 接待
    list.add(CommonWidget.workBenchIcon(title: "接待", backgroundColor: const Color.fromRGBO(239, 142, 53, 1),
      icon: Icon(Icons.handshake_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 报名
    list.add(CommonWidget.workBenchIcon(title: "报名", backgroundColor: const Color.fromRGBO(79, 119, 237, 1),
      icon: Icon(Icons.edit_note_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));

    return SizedBox(
      height: 400.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20.w),
            child: const Text("日常办公"),
          ),
          Wrap(
            spacing: 80.w,
            children: list,
          )
        ],
      ),
    );
  }

  /// 财务报销
  static Widget financialReimbursement(){
    List<Widget> list = [];
    /// 费用报销
    list.add(CommonWidget.workBenchIcon(title: "费用报销", backgroundColor: const Color.fromRGBO(79, 119, 237, 1),
      icon: Icon(Icons.currency_yen_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 采购申请
    list.add(CommonWidget.workBenchIcon(title: "采购申请", backgroundColor: const Color.fromRGBO(88, 202, 147, 1),
      icon: Icon(Icons.shopping_basket_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 付款申请
    list.add(CommonWidget.workBenchIcon(title: "付款申请", backgroundColor: const Color.fromRGBO(255, 198, 10, 1),
      icon: Icon(Icons.local_atm_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));
    /// 用章申请
    list.add(CommonWidget.workBenchIcon(title: "用章申请", backgroundColor: const Color.fromRGBO(79, 119, 237, 1),
      icon: Icon(Icons.approval_outlined , color: const Color.fromRGBO(228, 246, 241, 1), size: 50.w,),));

    return SizedBox(
      height: 220.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20.w),
            child: const Text("财务报销"),
          ),
          Wrap(
            spacing: 80.w,
            children: list,
          )
        ],
      ),
    );
  }


}

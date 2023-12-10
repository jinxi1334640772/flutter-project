import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 常量类
class Constant {

  /// toast 提示默认时长
  static const defaultToastDuration = Duration(seconds: 2);
  /// toast 提示默认颜色
  static const defaultToastColor = Color(0xFF424242);

  static double defaultWidth = 750.w;

  /// 搜索框相关样式 开始
  static const searchDecorationColor = Color.fromRGBO(240, 240, 240, 1);

  static TextStyle searchTextFiledStyle = TextStyle(
    fontSize: 26.sp,
    color: const Color(0xff051220)
  );

  static TextStyle searchTextFieldHintStyle = TextStyle(
    fontSize: 26.sp,
    color: const Color(0xff979DA3)
  );
  /// 搜索框相关样式 结束

  /// 主页面 左右侧padding值
  static double paddingLeftRight = 20.w;

  /// 个人微信
  static const logo = "assets/images/logo.png";

  static const Color colorGrey = Color.fromRGBO(144, 147, 153, 1);

}

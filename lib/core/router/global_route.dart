import 'package:flutter/material.dart';
import 'package:flutter_template/pages/message/message_list_page.dart';
import 'package:flutter_template/pages/mine/about_us.dart';
import 'package:flutter_template/pages/mine/clear_cache.dart';
import 'package:flutter_template/pages/mine/common_problem.dart';
import 'package:flutter_template/pages/mine/contact_customer.dart';
import 'package:flutter_template/pages/mine/feed_back.dart';
import 'package:flutter_template/pages/mine/file_upload_download.dart';
import 'package:flutter_template/pages/mine/user_detail.dart';
import 'package:flutter_template/splash.dart';

import '../../pages/address_book/address_book_detail.dart';
import '../../pages/login/login.dart';
import '../../pages/login/user_agreement.dart';
import '../../pages/message/message_detail_page.dart';
import '../../pages/mine/account_security.dart';
import '../../pages/mine/chart_demo.dart';
import '../../pages/mine/scan_code.dart';
import '../../pages/mine/system_settings.dart';
import '../../pages/toolbar.dart';

/// 路由
class GlobalRouter {

  /// 路由
  /// 从非toolbar页面（子页面）跳转到toolbar页面（主页）实现：
  /// pushName到对应的路由，因为Toolbar是单例模式，所以只会创建一个
  /// pushName之后，在ToolBar，initState中获取当前的路由，实现切换页面
  static final _routes = {
    /// 过渡页面
    '/': (BuildContext context, { Object? args}) => const SplashPage(),
    /// 主页面
    '/home': (BuildContext context, { Object? args}) => const Toolbar(),

    /// 登录页面
    '/loginPage': (BuildContext context, { Object? args}) => const Login(),
    /// 用户协议页面
    '/user_agreement': (BuildContext context, {Object? args}) => const UserAgreement(),

    /// 用户详情
    '/user_detail': (BuildContext context, {Object? args}) => const UserDetail(),
    /// 扫一扫
    '/scan_code': (BuildContext context, {Object? args}) => const ScanCode(),
    /// 常见问题
    '/common_problem': (BuildContext context, {Object? args}) => const CommonProblem(),
    /// 意见反馈
    '/feed_back': (BuildContext context, {Object? args}) => const FeedBack(),
    /// 修改密码
    '/account_security': (BuildContext context, {Object? args}) => const AccountSecurity(),
    /// 清除缓存
    '/clear_cache': (BuildContext context, {Object? args}) => const ClearCache(),
    /// 关于我们
    '/about_us': (BuildContext context, {Object? args}) => const AboutUs(),
    /// 联系客服
    '/contact_customer': (BuildContext context, {Object? args}) => const ContactCustomer(),
    /// 系统设置
    '/system_settings': (BuildContext context, {Object? args}) => const SystemSettings(),
    /// 图表demo
    '/chart_demo': (BuildContext context, {Object? args}) => const ChartDemo(),
    /// 文件上传与下载
    '/file_upload_download': (BuildContext context, {Object? args}) => const FileUploadDownload(),

    ///通讯录详情
    '/address_book_detail': (BuildContext context, {Object? args}) => const AddressBookDetail(),

    /// 信息列表
    '/message_list_page': (BuildContext context, {Object? args}) => const MessageListPage(),
    /// 信息详情
    '/message_detail_page': (BuildContext context, {Object? args}) => const MessageDetailPage(),

  };

  static GlobalRouter? _singleton;

  GlobalRouter._internal();

  factory GlobalRouter() {
    return _singleton??GlobalRouter._internal();
  }

  /// 监听route
  Route? getRoutes(RouteSettings settings) {
    String? routeName = settings.name;
    final Function builder = GlobalRouter._routes[routeName] as Function;
    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => builder(context, args: settings.arguments)
    );
  }
}
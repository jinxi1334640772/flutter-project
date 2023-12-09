import 'package:flutter/material.dart';
import 'package:flutter_template/config/constant.dart';
import 'package:flutter_template/core/utils/date_format_util.dart';
import 'package:flutter_template/core/widget/custom_app_bar.dart';
import 'package:flutter_template/model/messge_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 消息详情页面
class MessageDetailPage extends StatefulWidget {
  const MessageDetailPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {

  late MessageModel messageModel = MessageModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context, title: '消息详情'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 40.w, right: Constant.paddingLeftRight),
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            children: [
              titleWidget(),
              contentWidget(),
            ],
          ),
        ),
      )
    );
  }

  /// 标题
  titleWidget(){
    return Container(
      margin: EdgeInsets.only(top: 20.w),
      height: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(messageModel.title??"", style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.w600),),
          SizedBox(height: 10.w,),
          Text("${messageModel.send} 发起于 ${DateFormatUtil.formatYYYYmmddHHnn(messageModel.createTime??DateTime.now())}", style: TextStyle(fontSize: 26.sp, color: Constant.colorGrey),)
        ],
      ),
    );
  }

  /// 内容
  contentWidget(){
    return Html(
        data: messageModel.content,
    );
  }


  /// 初始话数据
  init(){
    setState(() {
      String id = Get.arguments;
      messageModel.id = id;
      messageModel.title = "消息详情$id";
      messageModel.send = "系统管理员";
      messageModel.createTime = DateTime.now();
      messageModel.content = """
    <h1>Header 1</h1>
<h2>Header 2</h2>
<h3>Header 3</h3>
<h4>Header 4</h4>
<h5>Header 5</h5>
<h6>Header 6</h6>
<h3>Ruby Support:</h3>
      <p>
        <ruby>
          漢<rt>かん</rt>
          字<rt>じ</rt>
        </ruby>
        &nbsp;is Japanese Kanji.
      </p>
      <h3>Support for <code>sub</code>/<code>sup</code></h3>
      Solve for <var>x<sub>n</sub></var>: log<sub>2</sub>(<var>x</var><sup>2</sup>+<var>n</var>) = 9<sup>3</sup>
      <p>One of the most <span>common</span> equations in all of physics is <br /><var>E</var>=<var>m</var><var>c</var><sup>2</sup>.</p>
      <h3>Table support (with custom styling!):</h3>
      <p>
      <q>Famous quote...</q>
      </p>
      <table>
      <colgroup>
        <col width="50%" />
        <col width="25%" />
        <col width="25%" />
      </colgroup>
      <thead>
      <tr><th>One</th><th>Two</th><th>Three</th></tr>
      </thead>
      <tbody>
      <tr>
        <td>Data</td><td>Data</td><td>Data</td>
      </tr>
      <tr>
        <td>Data</td><td>Data</td><td>Data</td>
      </tr>
      </tbody>
      <tfoot>
      <tr><td>fData</td><td>fData</td><td>fData</td></tr>
      </tfoot>
      </table>
      <h3>Custom Element Support:</h3>
      <flutter></flutter>
      <flutter horizontal></flutter>
      <h3>SVG support:</h3>
      <svg id='svg1' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
            <circle r="32" cx="35" cy="65" fill="#F00" opacity="0.5"/>
            <circle r="32" cx="65" cy="65" fill="#0F0" opacity="0.5"/>
            <circle r="32" cx="50" cy="35" fill="#00F" opacity="0.5"/>
      </svg>
      <h3>List support:</h3>
      <ol>
            <li>This</li>
            <li><p>is</p></li>
            <li>an</li>
            <li>
            ordered
            <ul>
            <li>With<br /><br />...</li>
            <li>a</li>
            <li>nested</li>
            <li>unordered
            <ol>
            <li>With a nested</li>
            <li>ordered list.</li>
            </ol>
            </li>
            <li>list</li>
            </ul>
            </li>
            <li>list! Lorem ipsum dolor sit amet.</li>
            <li><h2>Header 2</h2></li>
            <h2><li>Header 2</li></h2>
      </ol>
      <h3>Link support:</h3>
      <p>
        Linking to <a href='https://github.com'>websites</a> has never been easier.
      </p>
      <h3>Image support:</h3>
      <p>
        <img alt='Google' src='https://www.google.cn/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' />
        <a href='https://google.com'><img alt='Google' src='https://www.google.cn/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></a>
        <img alt='Alt Text of an intentionally broken image' src='https://www.google.cn/images/branding/googlelogo/2x/googlelogo_color_92x30d' />
      </p>
    """;
    });
  }


}

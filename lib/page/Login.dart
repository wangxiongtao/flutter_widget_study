import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/page/MyTabIndicator.dart';
import 'package:flutter_dawn_app/page/nesttab/SubmitButton.dart';
import 'package:flutter_dawn_app/util/DecimalFormat.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';

import 'nesttab/VerificationCodeButton.dart';

/// 创建时间：2020/8/12
/// 作者：Dawn
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Image image;
  int selectIndex = 0;
  FocusNode phoneFocusNode = FocusNode();
  FocusNode pwdFocusNode = FocusNode();
  TextEditingController _phoneController;
  TextEditingController _pwdController;

//  TextEditingController _pwdController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _phoneController = TextEditingController(text: "WEWQEWQEQWEQW");
    image = Image.asset(
      "images/icon_logo.png",
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
        body: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            image,
            SizedBox(
              height: 8,
            ),
            Text(
              "中国专业技术IT平台",
              style: TextStyle(fontSize: 14, color: Color(0xFF353233)),
            ),
            SizedBox(
              height: 40,
            ),
            _getLoginTabbar(),
            Offstage(
              offstage: selectIndex != 0,
              child: _getLoginByPhoneView(),
            ),
            Offstage(
              offstage: selectIndex != 1,
              child: _getLoginByCodeView(),
            ),
            Padding(
              child: SubmitButton(
                text: "登      录",
                onPressed: () =>
                    ToastUtil.toast("msg==" + _phoneController.text),
              ),
              padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
            )
          ],
        ),
      ),
    ));
  }

  Widget _getLoginTabbar() {
    List<String> list = ["手机密码登录", "验证码快捷登录"];
    return TabBar(
      onTap: (index) => setState(() => selectIndex = index),
      indicator: MyTabIndicator(),
      tabs: list
          .map((e) => Tab(
                text: e,
              ))
          .toList(),
      controller: _tabController,
    );
  }

  Widget _getLoginByPhoneView() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: Column(
        children: <Widget>[
          Container(
            height: 44,
            child: TextField(
              controller: _phoneController,
              focusNode: phoneFocusNode,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.numberWithOptions(),
              maxLength: 11,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              style: TextStyle(fontSize: 14, color: Colors.deepOrangeAccent),
              decoration: InputDecoration(
                counterText: "",
                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                hintText: "请输入手机号",
              ),
              onSubmitted: (value) {
                print("input===onSubmitted=====>" + value);
                phoneFocusNode.unfocus();
                FocusScope.of(context).requestFocus(pwdFocusNode);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 44,
            child: TextField(
              focusNode: pwdFocusNode,
              textInputAction: TextInputAction.done,
              obscureText: true,
              style: TextStyle(fontSize: 14, color: Colors.deepOrangeAccent),
              decoration: new InputDecoration(
                counterText: "",
                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                hintText: "请输入密码",
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getLoginByCodeView() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: Column(
        children: <Widget>[
          Container(
            height: 44,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5)))),
            child: TextField(
              controller: _phoneController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.numberWithOptions(),
              maxLength: 11,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              style: TextStyle(fontSize: 14, color: Colors.deepOrangeAccent),
              decoration: InputDecoration(
                  counterText: "",
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  hintText: "请输入手机号",
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none),
              onSubmitted: (value) {
                print("input===onSubmitted=====>" + value);
                phoneFocusNode.unfocus();
                FocusScope.of(context).requestFocus(pwdFocusNode);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 44,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5)))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      keyboardType:TextInputType.numberWithOptions(),
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(
                          fontSize: 14, color: Colors.deepOrangeAccent),
                      decoration: new InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          hintText: "请输入验证码",
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  VerificationCodeButton()
                ],
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

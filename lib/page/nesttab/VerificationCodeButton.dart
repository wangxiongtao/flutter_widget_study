import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/util/MyConfig.dart';

/// 创建时间：2020/8/12
/// 作者：Dawn
class VerificationCodeButton extends StatefulWidget {
  VerificationCodeButton({Key key}) : super(key: key);

  @override
  _VerificationCodeButtonState createState() => _VerificationCodeButtonState();
}

class _VerificationCodeButtonState extends State<VerificationCodeButton> {
  String tipsText = "获取验证码";
  Timer _timer;
  int totalSecondTime = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _getCode(),
      child: Container(
        constraints:BoxConstraints(
          minWidth: 50
        ),
        height: 45,
        alignment: Alignment.center,
        child: Text(tipsText,
            style: TextStyle(fontSize: 14, color: Colors.deepOrange)),
      ),
    );
  }

  _getCode() {
    if (_timer == null || !_timer.isActive) {
      totalSecondTime=totalSecondTime-1;
      setState(() {
        tipsText="$totalSecondTime秒";
      });
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        int diffTime=totalSecondTime-timer.tick;
        tipsText="$diffTime秒";
        if (timer.tick == totalSecondTime) {
          tipsText = "重新获取";
          _timer.cancel();
          _timer = null;
        }
        setState(() {

        });
        print("tick ${timer.tick}, timer isActive ${timer.isActive}");
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if(_timer!=null){
      _timer.cancel();
      _timer = null;
    }
    print("==code==dispose");
  }
}

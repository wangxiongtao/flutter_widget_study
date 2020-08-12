import 'package:flutter/material.dart';

/// 创建时间：2020/8/12
/// 作者：Dawn
class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  SubmitButton({this.text = "提交", this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [Color(0xFFFD7C32), Color(0xFFFB4529)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        height: 45,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

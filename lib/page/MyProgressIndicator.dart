import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/3 
/// 作者：Dawn
class MyProgressIndicator extends StatefulWidget {
  MyProgressIndicator({Key key}) : super(key: key);

  @override
  _MyProgressIndicatorState createState() => _MyProgressIndicatorState();
}

class _MyProgressIndicatorState extends State<MyProgressIndicator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body:SizedBox(
        height: 500,
        child:  Stack(
          children: [
            LinearProgressIndicator(

              valueColor: AlwaysStoppedAnimation(Colors.orange),
            ),
            Positioned(
              top: 100,
              right: 0,
              left: 0,
              child: LinearProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.2,
              ),
            ),
            Align(
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  backgroundColor: Colors.white38,
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              )
            )
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
import 'package:flutter/material.dart';

import 'BaseMaterialApp.dart';

/// 创建时间：2020/7/30 
/// 作者：Dawn
//FloatingActionButton({
//    Key key,
//    //  按钮上的组件，可以是Text、icon, etc.
//    this.child,
//    //长按提示
//    this.tooltip,
//    // child的颜色（尽在child没有设置颜色时生效）
//    this.foregroundColor,
//    //背景色，也就是悬浮按键的颜色
//    this.backgroundColor,
//    this.heroTag = const _DefaultHeroTag(),
//    //阴影长度
//    this.elevation = 6.0,
//    //高亮时阴影长度
//    this.highlightElevation = 12.0,
//    //按下事件回调
//    @required this.onPressed,
//    //是小图标还是大图标
//    this.mini = false,
//    //按钮的形状(例如：矩形Border，圆形图标CircleBorder)
//    this.shape = const CircleBorder(),
//    this.clipBehavior = Clip.none,
//    this.materialTapTargetSize,
//    this.isExtended = false,
//  })
class MyButton extends StatefulWidget {
  MyButton({Key key}) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RaisedButton(
              color: Colors.teal,
              child: Text("1111"),
              textColor: Colors.orangeAccent,
            ),

            RaisedButton(

              color: Colors.teal,
              highlightColor: Colors.deepPurpleAccent,
              splashColor: Colors.deepOrangeAccent,
              colorBrightness: Brightness.dark,
              elevation: 50.0,
              highlightElevation: 100.0,
              disabledElevation: 20.0,
              onPressed: () {
                //TODO
              },
              child: Text(
                'RaisedButton1',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.access_alarm),
              tooltip: "ToolTip",
//              foregroundColor: Colors.white,
//              backgroundColor: Colors.deepPurple,
              shape:  Border(),
              onPressed: () {
                //click callback
              },
            )



          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
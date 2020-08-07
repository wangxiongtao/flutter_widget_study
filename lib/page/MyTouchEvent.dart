import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/7
/// 作者：Dawn
class MyTouchEvent extends StatefulWidget {
  MyTouchEvent({Key key}) : super(key: key);

  @override
  _MyTouchEventState createState() => _MyTouchEventState();
}

class _MyTouchEventState extends State<MyTouchEvent> {
  double width = 100;
  double height = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
        body: Stack(
          children: [
            GestureDetector(
              child: Container(
                height: height,
                width: width,
                color: Colors.green,
              ),
              onDoubleTap: () {
                print("双击onDoubleTap");
              },
              onLongPress: () {
                print("长按onLongPress");
              },
              onLongPressUp: () {
                print("长按抬起onLongPressUP");
              },
              onTap: () {
                print("单机onTap");
              },
              onTapDown: (details) {
                print("onTapDown===${details.globalPosition}");
              },
              onTapUp: (details) {
                print("onTapUp===${details.globalPosition}");
              },
              onVerticalDragDown: (_) {
                print("竖直方向拖动按下onVerticalDragDown:" + _.globalPosition.toString());
              },
              onVerticalDragStart: (_) {
                print("竖直方向拖动开始onVerticalDragStart" + _.globalPosition.toString());
              },
              onVerticalDragUpdate: (_) {
                print("竖直方向拖动更新onVerticalDragUpdate" + _.globalPosition.toString());
                setState(() {
                  height = _.globalPosition.dy;
                });
              },
              onVerticalDragCancel: () {
                print("竖直方向拖动取消onVerticalDragCancel");
              },
              onVerticalDragEnd: (_) {
                print("竖直方向拖动结束onVerticalDragEnd");
                setState(() {
                  height = 100;
                });
              },
            ),








            IgnorePointer(
              ignoring: false,
              child: GestureDetector(
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                ),
                onDoubleTap: () {
                  print("子类双击onDoubleTap");
                },
                onLongPress: () {
                  print("子类长按onLongPress");
                },
                onLongPressUp: () {
                  print("子类长按抬起onLongPressUP");
                },
                onTap: () {
                  print("子类单机onTap");
                },
                onTapDown: (details) {
                  print("子类onTapDown===${details.globalPosition}");
                },
                onTapUp: (details) {
                  print("子类onTapUp===${details.globalPosition}");
                },
                onVerticalDragDown: (_) {
                  print(
                      "子类竖直方向拖动按下onVerticalDragDown:" + _.globalPosition.toString());
                },
                onVerticalDragStart: (_) {
                  print(
                      "子类竖直方向拖动开始onVerticalDragStart" + _.globalPosition.toString());
                },
                onVerticalDragUpdate: (_) {
                  print(
                      "子类竖直方向拖动更新onVerticalDragUpdate" + _.globalPosition.toString());
                  setState(() {
//              height=_.globalPosition.dy;
                  });
                },
                onVerticalDragCancel: () {
                  print("子类竖直方向拖动取消onVerticalDragCancel");
                },
                onVerticalDragEnd: (_) {
                  print("子类竖直方向拖动结束onVerticalDragEnd");
                  setState(() {
//              height=100;
                  });
                },
              ),
            ),



          ],
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

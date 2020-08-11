import 'package:flutter/cupertino.dart';
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




//
//const FlatButton({
//...
//@required this.onPressed, //按钮点击回调
//this.textColor, //按钮文字颜色
//this.disabledTextColor, //按钮禁用时的文字颜色
//this.color, //按钮背景颜色
//this.disabledColor,//按钮禁用时的背景颜色
//this.highlightColor, //按钮按下时的背景颜色
//this.splashColor, //点击时，水波动画中水波的颜色
//this.colorBrightness,//按钮主题，默认是浅色主题
//this.padding, //按钮的填充
//this.shape, //外形
//@required this.child, //按钮的内容
//})
class MyButton extends StatefulWidget {
  MyButton({Key key}) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  var _checkValue=false;
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
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
              onPressed: () {},
            ),
            PopupMenuButton(
              offset: Offset(0, 200),
              child: Text("CLICK"),
              itemBuilder:(c){
                return [
                  PopupMenuItem(
                    child: Text("1111"),
                  ),
                  PopupMenuItem(
                    child: Text("22222"),
                  ),
                ];
              } ,

            ),
            SizedBox(
              width: 100,
              child:   CheckboxListTile(
                activeColor: Colors.red,
                checkColor: Colors.deepPurple,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('老孟'),
                value: _checkValue,
                onChanged: (value){
                  setState(() {
                    _checkValue = value;
                  });
                },
              ),
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
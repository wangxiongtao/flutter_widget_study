
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildDemo();
  }
  Widget _buildDemo(){

      return Container(
        child:  Container(
          child: Text('Hello Wolrd !',textDirection:TextDirection.ltr,),
          alignment: Alignment(0, -1),
          width: 300,
          height: 300,
//          decoration: BoxDecoration(
////              color:Colors.yellow,
////              shape:BoxShape.circle ,
////            borderRadius:BorderRadius.all(Radius.circular(20.0)),
//              border: Border.all(
//                color: Colors.green,
//                width: 20,
//                style: BorderStyle.solid
//              ),
//            borderRadius:BorderRadius.all(Radius.circular(20.0)),
//          ),
        decoration: new BoxDecoration(
//背景
          color: Colors.deepPurpleAccent,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          //设置四周边框
          border:  Border.all(width: 5, color: Colors.red),
          boxShadow: [
            new BoxShadow(
              color:Colors.green,
              offset: Offset(2.0, 2.0),
              blurRadius: 50,

            ),
            new BoxShadow(
              color:Colors.deepOrangeAccent,
              offset: Offset(2.0, 2.0),
              blurRadius: 100,

            ),
          ],
        ),


        ),
        alignment: Alignment(-1, -1),
        width: 300, //宽
        height:300, //高
        color: Colors.white,
        //设置边框
//        decoration: new BoxDecoration(
//          gradient: new LinearGradient(
//              begin: Alignment.topLeft,
//              end: Alignment(0.8, 0),
//              colors: [const Color(0xFFFFFFEE), const Color(0xFF999999)]
//          ),
//          color: Colors.blue,
//          border: Border.all(
//            color: Colors.black,
//            width: 8.0,
//          ),
//        ),
        //内边距
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.fromLTRB(0,30,0,30),
        //旋转
//        transform: Matrix4.rotationZ(0.4),
      );
  }

}
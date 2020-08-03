import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';

/// 创建时间：2020/8/3
/// 作者：Dawn
class MySomeBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MySomeBoxState();
  }
}

class MySomeBoxState extends State<MySomeBox> {
  bool _show0 = true;
  bool _show1 = true;
  bool _show2 = true;
  bool _show3;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseMaterialApp(
      body: Column(
    crossAxisAlignment : CrossAxisAlignment.start,
        children: [
          _getBox2(),
//          SizedBox(height: 50,),
          _getBox3(),
//          SizedBox(height: 50,),
          _getBox4(),
          _getBox5(),
          _getBox6(),
          _getBox7(),
        ],
      ),
    );
  }

  Widget _getBox1() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 50.0 //最小高度为50像素
          ),
      child: Text(
        "我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的我的",
        style: TextStyle(backgroundColor: Colors.yellow),
      ),
    );
  }

  Widget _getBox2() {
    return Container(
      color: Colors.red,
      width: 300,
//      constraints: BoxConstraints(
//          maxHeight: 50.0 //最小高度为50像素
//          ),
      child: RaisedButton(
        color: Colors.teal,
        child: Text("1111"),
        textColor: Colors.orangeAccent,
        onPressed: () {
          setState(() {
//            _show0=!_show0;
            _show1=!_show1;
          });
        },
      ),
    );
  }

  Widget _getBox3() {
    return Visibility(visible: _show0, child: TextBox(Colors.red));//切换执行initSate()!!!!
  }

  Widget _getBox4() {
    return Offstage(offstage: !_show1, child: TextBox(Colors.blue));//切换不执行initSate()!!!!
  }

  Widget _getBox5() {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
            borderRadius: BorderRadius.circular(10.0), //3像素圆角
            boxShadow: [ //阴影
              BoxShadow(
                  color:Colors.black54,
                  offset: Offset(2.0,2.0),
                  blurRadius: 4.0
              )
            ]
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text("Login", style: TextStyle(color: Colors.white),),
        )
    );
  }
  Widget _getBox7() {
    return Card(
      child: Padding(
          padding: EdgeInsets.all(20),
        child: Text("11111111"),
      ),
    );
  }
  Widget _getBox6() {
    return Wrap(

      runSpacing: 10,
      spacing: 10,

      children: [
        Chip(
          backgroundColor: Colors.red,
          label: Text("145"),
        ),
        Chip(
          backgroundColor: Colors.red,
          label: Text("hhahha"),
        ),
        Chip(
          backgroundColor: Colors.red,
          label: Text("0000"),
        ),
        Chip(
          backgroundColor: Colors.red,
          label: Text("呵呵呵呵"),
        ),
        Chip(
          backgroundColor: Colors.red,
          label: Text("啊的1111迫使看懂萨科的咖啡店【快递赔付33333333rrrrr"),
        ),
        Chip(
          backgroundColor: Colors.red,
          label: Text("1"),
          labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
      ],
    );
  }
}

class TextBox extends StatefulWidget {
  final Color _color;

  TextBox(this._color);

  @override
  State<StatefulWidget> createState() {
    return MyState(_color);
  }
}

class MyState extends State<TextBox> {
  Color _color;

  MyState(Color _color) {
    this._color = _color;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("==initState==color==$_color");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: _color,
      height: 100,
      width: 100,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

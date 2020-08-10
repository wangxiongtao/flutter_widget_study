import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/model/UserBean.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/10 
/// 作者：Dawn
class MyJson extends StatefulWidget {
  MyJson({Key key}) : super(key: key);

  @override
  _MyJsonState createState() => _MyJsonState();
}

class _MyJsonState extends State<MyJson> {
  String text;
  List<Widget> list=[MyColorW(),MyColorw2()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decodeJson();
    print("==RESULT===${UseBean("11","333")==UseBean("22","333")}");
    List<UseBean>list1=[UseBean("11","333"),UseBean("116666","33354")];
    print("==RESULT=list1==${list1.indexOf(UseBean("11","33354"))}");
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: Column(
        children: <Widget>[
          Text("==>"+text),
          Row(children: list,),
          RaisedButton(
            child: Text("11"),
            onPressed: (){
              setState(() {
                list.insert(0, list.removeAt(1));
              });
            },
          ),

        ],
      ),
    );
  }


  decodeJson() {
    var data= '{"name": "Knight","email": "Knight@163.com"}';
    Map<String,dynamic> user = json.decode(data);
    //输出名字
    text="Hello,my name is ${user['name']}"+"\n"+"Hello,This is my email ${user['email']}";
    setState(() {

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class MyColorW extends StatefulWidget {
  @override
  _MyColorWState createState() => _MyColorWState();
}

class _MyColorWState extends State<MyColorW> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    );
  }
}


class MyColorw2 extends StatefulWidget {
  @override
  _MyColorw2State createState() => _MyColorw2State();
}

class _MyColorw2State extends State<MyColorw2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
    );
  }
}






class MyBean{
  int age;
  MyBean(int nAge)
  {
    this.age = nAge;
  }



}
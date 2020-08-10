import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';

/// 创建时间：2020/8/7 
/// 作者：Dawn
class MyNotice extends StatefulWidget {
  MyNotice({Key key}) : super(key: key);

  @override
  _MyNoticeState createState() => _MyNoticeState();
}

class _MyNoticeState extends State<MyNotice> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: Column(
        children: [
          RaisedButton(
            child: Text("111"),
            onPressed:(){
//              MyNoticeData("111").dispatch(context);
            Navigator.popUntil(context, (route){
              return  route.isFirst;
            });
            } ,
          ),
          NotificationListener<MyNoticeData>(
            onNotification: (MyNoticeData n){
              ToastUtil.toast("收到消息拉啊啦啦"+n.msg);
              return true;//false，表示不阻止冒泡

            },
            child: Builder(builder: (c){
              return RaisedButton(
                child: Text("发送消息q"),
                onPressed:(){
                  MyNoticeData("111asdsadasdas").dispatch(c);
                } ,
              );
            })
          )



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

class MyNoticeData extends Notification {
  final String msg;
  MyNoticeData(this.msg);
}
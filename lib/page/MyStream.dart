import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/12 
/// 作者：Dawn
class MyStream extends StatefulWidget {
  MyStream({Key key}) : super(key: key);

  @override
  _MyStreamState createState() => _MyStreamState();
}

class _MyStreamState extends State<MyStream> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Stream stream1 = Stream.fromIterable([11, 22, 33]);
    stream1.listen((event) {
      print("==stream1====>$event");
    });


    Stream stream2 = Stream.fromFuture(Future.delayed(Duration(seconds: 4),(){
      return "111";
    }));
    stream2.listen((event) {
      print("==stream2====>$event");
    });
    print("==stream====>end");
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: Text('111'),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
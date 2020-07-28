import 'package:flutter/material.dart';

class BaseMaterialApp extends StatelessWidget{
  final Widget body;

  const BaseMaterialApp({Key key, this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(
        appBar: new AppBar(title: new Text("")),
        body:body
      ),
    );
  }

}
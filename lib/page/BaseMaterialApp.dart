import 'package:flutter/material.dart';

class BaseMaterialApp extends StatelessWidget {
  final Widget body;
  final Widget bottom;

  const BaseMaterialApp({Key key, this.body,this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: Scaffold(
          appBar: new AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bottom: bottom,
            title: new Text("我只是标题",style:TextStyle(fontSize: 20)),
            centerTitle: true,
            elevation: 0.5,
            actions: [
              // 非隐藏的菜单
              new IconButton(
                  icon: new Icon(Icons.map),
                  onPressed: () {}
              ),
//              new IconButton(
//                  icon: new Icon(Icons.scanner),
//                  onPressed: () {}
//              ),
            ],
          ),
          body: body),
    );
  }
}

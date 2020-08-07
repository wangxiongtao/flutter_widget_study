import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/7 
/// 作者：Dawn
class MyFluro extends StatefulWidget {
  final String goodsId;

  MyFluro(this.goodsId);


  @override
  _MyFluroState createState() => _MyFluroState();
}

class _MyFluroState extends State<MyFluro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: Text("1111"),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
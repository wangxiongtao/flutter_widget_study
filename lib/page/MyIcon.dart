import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/7/30 
/// 作者：Dawn
class MyIcon extends StatelessWidget {
  MyIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.file_download,
              color: Colors.red,
              semanticLabel: "user",
              size: 100.0,),
          ],
        ),
      ),
    );
  }
}

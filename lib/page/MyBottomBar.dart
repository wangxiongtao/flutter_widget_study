import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/2
/// 作者：Dwan
class MyBottomBar extends StatefulWidget {
  MyBottomBar({Key key}) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
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
          Expanded(
            child: Container(color: Colors.red,),
          ),
          BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.home)),
                SizedBox(), //中间位置空出
                IconButton(icon: Icon(Icons.business)),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
            ),
          ),
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

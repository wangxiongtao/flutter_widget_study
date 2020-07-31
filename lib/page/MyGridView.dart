import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/7/31
/// 作者：Dawn
class MyGridView extends StatefulWidget {
  MyGridView({Key key}) : super(key: key);

  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
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
            child: _getGridView(),
          ),
          Expanded(
            child: _getGridView2(),
            flex: 3,
          ),
        ],
      ),
    );
  }

  Widget _getGridView() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 2,
      children: [
        Text("1",
            style: TextStyle(
                decoration: TextDecoration.underline,
                backgroundColor: Colors.blueGrey)),
        Text("2", style: TextStyle(decoration: TextDecoration.underline)),
        Text("3", style: TextStyle(decoration: TextDecoration.underline)),
        Text("4", style: TextStyle(decoration: TextDecoration.underline)),
        Text("5", style: TextStyle(decoration: TextDecoration.underline)),
        Text("6", style: TextStyle(decoration: TextDecoration.underline)),
        Text("7", style: TextStyle(decoration: TextDecoration.underline)),
        Text("8", style: TextStyle(decoration: TextDecoration.underline)),
        Text("9", style: TextStyle(decoration: TextDecoration.underline)),
        Text("10", style: TextStyle(decoration: TextDecoration.underline)),
        Text("11", style: TextStyle(decoration: TextDecoration.underline)),
      ],
    );
  }

  GridView _getGridView2() {
    return GridView.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          return Text("$index",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  backgroundColor: Colors.blueGrey));
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

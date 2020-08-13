import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:logger/logger.dart';

/// 创建时间：2020/8/13 
/// 作者：Dawn
class MyDraggableScrollableSheet extends StatefulWidget {
  MyDraggableScrollableSheet({Key key}) : super(key: key);

  @override
  _MyDraggableScrollableSheetState createState() =>
      _MyDraggableScrollableSheetState();
}

class _MyDraggableScrollableSheetState
    extends State<MyDraggableScrollableSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: _getW2(),
    );
  }

  Widget _getW(){
    return DraggableScrollableSheet(
        builder:
            (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Colors.blue[100],
            child: ListView.builder(
              controller: scrollController,
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('评论 $index'));
              },
            ),
          );
        });
  }
  Widget _getW2(){
    return  Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583224371276&di=c8a9d759bdde3218aef0f24268f11ab2&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Fent%2Fr%2F2009-03-27%2FU2507P28T3D2441286F328DT20090327082744.jpg'),
            Container(
              height: 200,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('电影介绍'),
            ),
          ],
        ),
        Positioned.fill(
            child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.4,
                minChildSize: 0.4,
                maxChildSize: 1,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    color: Colors.blue[100],
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text('评论 $index'));
                      },
                    ),
                  );
                }))
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
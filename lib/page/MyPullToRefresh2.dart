import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/page/MyNestScrollView.dart';
import 'package:flutter_dawn_app/page/MyPullToRefresh3.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// 创建时间：2020/8/6 
/// 作者：Dawn
class MyPullToRefresh2 extends StatefulWidget {
  MyPullToRefresh2({Key key}) : super(key: key);

  @override
  _MyPullToRefresh2State createState() => _MyPullToRefresh2State();
}

class _MyPullToRefresh2State extends State<MyPullToRefresh2> {
  List<String>list=List.generate(20, (index) => "Qitem==${index}");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: EasyRefresh(
        topBouncing: false,
        bottomBouncing: false,
//        header: ClassicalHeader(refreshedText: "刷新",overScroll: false),
//        footer: ClassicalFooter(loadingText: "加载",),
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh:(){
          return _onRefresh();
        },
        onLoad:(){
          return _onRefresh();
        },
        child: getListView(),

//        builder:(context, physics, header, footer) {
//
//          return getListView();
//        }
      )
    );
  }
  _onRefresh() async{
     await Future.delayed(Duration(seconds: 2));
     Navigator.of(context).push(MaterialPageRoute(
       builder: (c)=>MyPullToRefresh3()
     ));

  }

  Widget getListView(){
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (c,i){
        return ListTile(
          title: Text(list[i]),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
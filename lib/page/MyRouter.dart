

import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/page/MyNotice.dart';
import 'package:flutter_dawn_app/page/MyProvider2.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';

/// 创建时间：2020/8/5 
/// 作者：Dawn
class MyRouter extends StatefulWidget {
  MyRouter({Key key}) : super(key: key);

  @override
  _MyRouterState createState() => _MyRouterState();
}

class _MyRouterState extends State<MyRouter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
//    var d=of().shareData;
  }

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments;
    ToastUtil.toast(args);
    return BaseMaterialApp(
      body: Column(
        children: [

          RaisedButton(
            child: Text("跳转到下一页Page1=="),
            onPressed: (){
              _openPage(MyNotice());

            },
          ),
          RaisedButton(
            child: Text("跳转到下一页,"),
            onPressed: (){
              _openPage2(MyNotice());
            },
          ),

        ],
      ),
    );
  }
  ShareMyDataWidget of(){
    return context.getElementForInheritedWidgetOfExactType<ShareMyDataWidget>().widget;
  }
  _openPage(Widget page){
//    Navigator.push(context, new MaterialPageRoute(builder: (context){
//      return page;
//    }));
  Navigator.of(context).pushNamed("/MiddlePage");
  }
  _openPage2(Widget page){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return page;
    },
    fullscreenDialog: true));
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class MiddlePage extends StatefulWidget {
  final int data;

  MiddlePage({Key key, @required this.data}) : super(key: key);

  @override
  _MiddlePageState createState() => _MiddlePageState();
}

class _MiddlePageState extends State<MiddlePage> {
  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
        body: Column(
          children: [
            RaisedButton(
              child: Text("Page2中间页面--上个页面的传值--：${widget.data}"),
              onPressed: ()async{
               String  result= await _openPage(PageNext(data: widget.data));
               ToastUtil.toast(result);
               if(result==null){
                 Navigator.of(context).pop();
               }
              },
            ),
            RaisedButton(
              child: Text("打开新页面并删除之前的页面"),
              onPressed: (){
                _openPage3(PageNext());
              },
            ),
          ],
        )
    );
  }
   _openPage(Widget page) async {
    return await Navigator.push(context, new MaterialPageRoute(builder: (context){
      return page;
    }));
  }
  _openPage3(Widget page){//打开新页面并删除之前的页面
    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context){
      return page;
    }),(route){
      return false;
    });
  }
}


class PageNext extends StatefulWidget {
  final int data;

  const PageNext({Key key, this.data}) : super(key: key);
  @override
  _PageNextState createState() => _PageNextState();
}

class _PageNextState extends State<PageNext> {
  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: Column(
        children: [
          RaisedButton(
            child: Text("Page3==NextPage====value==${widget.data}"),
            onPressed: (){
              Navigator.of(context).pop("收到啦");
            },
          ),
          RaisedButton(
            child: Text("返回到首页"),
            onPressed: (){
              Navigator.of(context).popUntil((route) => route.isFirst);
//              Future.delayed(Duration.zero).then((value) =>  Navigator.popUntil(context, ModalRoute.withName("/MyRouter")));

//              Navigator.of(context).popUntil((route) => route.isActive);
//              Navigator.of(context).pushNamedAndRemoveUntil("/",(route){
//                return route.isFirst;
//              });
//              Navigator.of(context).popUntil(ModalRoute.withName('/MyRouter'));// false能够确保删除先前所有实例。
//              Navigator.of(context)..pop()..pop()..pop();// false能够确保删除先前所有实例。\
//            Navigator.of(context).popUntil((route) {
//              print("==route=name===>${route}");
//              print("==route=name===>${route.isFirst}");
//              return true;
//            });
//            Navigator.of(context).popUntil(ModalRoute.withName('/'));
            },
          ),
        ],
      )
    );
  }
}

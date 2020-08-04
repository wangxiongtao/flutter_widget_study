import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/4
/// 作者：Dawn
class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({Key key}) : super(key: key);

  @override
  _MyInheritedWidgetState createState() => _MyInheritedWidgetState();
}

class _MyInheritedWidgetState extends State<MyInheritedWidget> {
  int count = 100;
  Function() setData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("==build==_MyInheritedWidgetState===>");
    return BaseMaterialApp(
      body:ShareDataWidget(
        data: count,
        child:  Column(
          children: [
            RaisedButton(
              child: Text("add----$count"),
              onPressed:(){
                setState(() {
//                  count=100;
                count+=3;
                });
              },
            ),
            MyShowText(),
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class MyShowText extends StatefulWidget {


  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyShowText> {
  final int data = 0;

  @override
  Widget build(BuildContext context) {
    print("==build==MyShowText=data==>");
    return RaisedButton(
      child: Text("=父组件的data==${of(context).data}"),
      onPressed: () {
        setState(() {

//                  count=100;
        });
      },
    );
//    return Text("=ShareDataWidget.of(context).data==$data");
  }

  @override
  void didUpdateWidget(MyShowText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("==build==didUpdateWidget===currentWidget===data==>");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("==build==didChangeDependencies=data==>");
  }

  //定义一个便捷方法，方便子树中的widget获取共享数据
  ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>(); //ata改变调用子组件的didChangeDependencies方法
//    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;//data改变不会不调调用子组件的didChangeDependencies方法
  }
}

//共享的数据
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return true;
  }
}

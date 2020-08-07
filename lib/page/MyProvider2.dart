import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/model/ShowCount.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/6 
/// 作者：Dawn
class MyProvider2 extends StatefulWidget {
  MyProvider2({Key key}) : super(key: key);

  @override
  _MyProvider2State createState() => _MyProvider2State();
}

class _MyProvider2State extends State<MyProvider2> {
  int _count=0;
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
          RaisedButton(child: Text("CLICK=父组件==${of().shareData}"),onPressed: (){
//            context.read<ShowCount>().increment();
//            setState(() {
//              of().shareData++;
//            }
//            );
          },),
//          ShareMyDataWidget(
//            of().shareData,
            MyChildWidget(),
//          )
        ],
      ),
    );
  }
  ShareMyDataWidget of(){
//    return context.getElementForInheritedWidgetOfExactType<ShareMyDataWidget>().widget;//不执行didChangeDependencies
    return context.dependOnInheritedWidgetOfExactType<ShareMyDataWidget>();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}


class MyChildWidget extends StatefulWidget {
//  final int count;

//  const MyChildWidget({Key key, this.count}) : super(key: key);
  @override
  _MyChildWidgetState createState() => _MyChildWidgetState();
}

class _MyChildWidgetState extends State<MyChildWidget> {
  @override
  Widget build(BuildContext context) {

    print("==share=child===build====");
    return RaisedButton(
//      child: Text("父组件的值=====>${widget.count}"),
      child: Builder(builder: (context1){
        print("==share=child=button==build====");
        return Text("父组件的值=====>${of().shareData}");
      }),
      onPressed: (){
        Navigator.of(context).pushNamed("/MyRouter");
      },
    );
  }
  ShareMyDataWidget of(){
//    return context.getElementForInheritedWidgetOfExactType<ShareMyDataWidget>().widget;//不执行didChangeDependencies
    return context.dependOnInheritedWidgetOfExactType<ShareMyDataWidget>();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("==share====didChangeDependencies====");
  }
}












class ShareMyDataWidget  extends InheritedWidget{
   int shareData;
  final Widget child;
  int get shareData1=>shareData;

  ShareMyDataWidget(this.shareData, this.child);
//  ShareMyDataWidget of(BuildContext context){
//     return context.dependOnInheritedWidgetOfExactType()
//   }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;////如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
  }

}
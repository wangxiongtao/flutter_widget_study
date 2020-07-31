import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';

/// 创建时间：2020/7/31 
/// 作者：Dawn

class MyCustomerTabBar2 extends StatefulWidget {
  MyCustomerTabBar2({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyState();
  }
}

class MyState extends State<MyCustomerTabBar2> with SingleTickerProviderStateMixin{
  TabController _controller;
  TabController _controller2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(vsync:this, length: 4);
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getTabBarView();
  }

  TabBar _getTabBar(){
    List<Tab>list=List();
    list.add(Tab(text: "tab1"));
    list.add(Tab(text:"tab2"));
    list.add(Tab(text:"tab3"));
    list.add(Tab(text:"tab4"));
    if(_controller==null){
      _controller=TabController(initialIndex: 1, vsync:this, length: list.length);
      _controller.addListener(() {
        print("=_controller111====>${_controller.indexIsChanging}");
        print("=_controller222====>${_controller.index}");
      });
    }
    return TabBar(
      tabs: list,
      controller:_controller,
      labelColor: Colors.deepOrangeAccent,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      indicatorColor: Colors.red,
      indicatorSize: TabBarIndicatorSize.label,
      onTap:(int index){
        ToastUtil.toast("click====>$index");
      } ,

    );
  }
  TabBarView _getTabBarView(){
    return TabBarView(
        controller: _controller,
//        physics: NeverScrollableScrollPhysics(),//禁止滑动
        children: [
          Text("101",style: TextStyle(backgroundColor: Colors.grey),),
          Text("1211",style: TextStyle(backgroundColor: Colors.deepOrangeAccent),),
          Text("131",style: TextStyle(backgroundColor: Colors.blue),),
          Text("141",style: TextStyle(backgroundColor: Colors.redAccent),),
        ]
    );
  }
  TabBarView _getTabBarView2(){
    return TabBarView(
        controller: _controller2,
//        physics: NeverScrollableScrollPhysics(),//禁止滑动
        children: [
          Text("11",style: TextStyle(backgroundColor: Colors.grey),),
          Text("12",style: TextStyle(backgroundColor: Colors.deepOrangeAccent),),
          Text("13",style: TextStyle(backgroundColor: Colors.blue),),
          Text("14",style: TextStyle(backgroundColor: Colors.redAccent),),
        ]
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}


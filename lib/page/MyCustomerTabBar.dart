import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/page/MyCustomerTabBar2.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';

/// 创建时间：2020/7/31
/// 作者：Dawn

class MyCustomerTabBar extends StatefulWidget {
  MyCustomerTabBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyState();
  }
}

class MyState extends State<MyCustomerTabBar>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  TabController _controller2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseMaterialApp(
      body: Column(
        children: [
          _getTabBar(),
          Expanded(
            child: _getTabBarView(),
          )
        ],
      ),
//      body: Container(
//        child: _getTabBar(),
//        color: Colors.redAccent,
//      ),
    );
  }

  Widget _getTabBar() {
    List<Tab> list = List();
    list.add(Tab(text: "tab2"));
    list.add(Tab(text: "tab3"));
    list.add(Tab(text: "tab4"));
    if (_controller == null) {
      _controller = TabController(initialIndex: 2, vsync: this, length: list.length);
      _controller.addListener(() {
        print("=_controller111====>${_controller.indexIsChanging}");
        print("=_controller222====>${_controller.index}");
      });
    }
    return Row(
      children: [
//        Expanded(child: Text("111"),),
        Expanded(
//          flex: 3,
          child: TabBar(
            tabs: list,
            controller: _controller,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            indicatorColor: Colors.yellow,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
            onTap: (int index) {
              ToastUtil.toast("click====>$index");
            },
          ),
        ),
//        Expanded(child: Text("222"),),
      ],
    );
  }

  TabBarView _getTabBarView() {
    return TabBarView(controller: _controller,
//        physics: NeverScrollableScrollPhysics(),//禁止滑动
        children: [
          MyCustomerTabBar2(),
          Text(
            "123",
            style: TextStyle(backgroundColor: Colors.deepOrangeAccent),
          ),
          Text(
            "13",
            style: TextStyle(backgroundColor: Colors.blue),
          ),
//          Text(
//            "14",
//            style: TextStyle(backgroundColor: Colors.redAccent),
//          ),
        ]);
  }

  TabBarView _getTabBarView2() {
    return TabBarView(controller: _controller2,
//        physics: NeverScrollableScrollPhysics(),//禁止滑动
        children: [
          Text(
            "11",
            style: TextStyle(backgroundColor: Colors.grey),
          ),
          Text(
            "12",
            style: TextStyle(backgroundColor: Colors.deepOrangeAccent),
          ),
          Text(
            "13",
            style: TextStyle(backgroundColor: Colors.blue),
          ),
          Text(
            "14",
            style: TextStyle(backgroundColor: Colors.redAccent),
          ),
        ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

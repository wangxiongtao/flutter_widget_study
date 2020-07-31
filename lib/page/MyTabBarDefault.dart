import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/7/31
/// 作者：Dawn
class MyTabBarDefault extends StatefulWidget {
  MyTabBarDefault({Key key}) : super(key: key);

  @override
  _MyTabBarDefaultState createState() => _MyTabBarDefaultState();
}

class _MyTabBarDefaultState extends State<MyTabBarDefault> {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Zeroth'),
    Tab(text: 'First'),
    Tab(text: 'Second'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
        initialIndex:1,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          backgroundColor: Colors.lime,
//          appBar: AppBar(
//            bottom: TabBar(
//              tabs: tabs,
//            ),
//          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                child:  TabBar(
                  tabs: tabs,
                ),
//                child: Text(
//                  tab.text + ' Tab',
//                  style: Theme.of(context).textTheme.headline5,
//                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

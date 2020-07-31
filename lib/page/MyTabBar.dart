import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/page/MyTabBarDefault.dart';

/// 创建时间：2020/7/31
/// 作者：Dawn

//
///**
//    const TabBar({
//    Key key,
//    @required this.tabs,//显示的标签内容，一般使用Tab对象,也可以是其他的Widget
//    this.controller,//TabController对象
//    this.isScrollable = false,//是否可滚动
//    this.indicatorColor,//指示器颜色
//    this.indicatorWeight = 2.0,//指示器高度
//    this.indicatorPadding = EdgeInsets.zero,//底部指示器的Padding
//    this.indicator,//指示器decoration，例如边框等
//    this.indicatorSize,//指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
//    this.labelColor,//选中label颜色
//    this.labelStyle,//选中label的Style
//    this.labelPadding,//每个label的padding值
//    this.unselectedLabelColor,//未选中label颜色
//    this.unselectedLabelStyle,//未选中label的Style
//    }) : assert(tabs != null),
//    assert(isScrollable != null),
//    assert(indicator != null || (indicatorWeight != null && indicatorWeight > 0.0)),
//    assert(indicator != null || (indicatorPadding != null)),
//    super(key: key);
// */

class MyTabBar extends StatefulWidget {
  MyTabBar({Key key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'LEFT',
    ),
    Tab(text: 'RIGHT'),
    Tab(text: 'RIGHT2'),
    Tab(text: 'RIGHT4'),
    Tab(text: 'RIGHT7'),
    Tab(text: 'RIGHT710'),
  ];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      bottom: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        dragStartBehavior: DragStartBehavior.down,
        children: myTabs.map((Tab tab) {
          final String label = tab.text.toLowerCase();
          return Center(
            child: new MyTabBarDefault(),
//            child: Text(
//              'This is the $label tab',
//              style: const TextStyle(fontSize: 36),
//            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

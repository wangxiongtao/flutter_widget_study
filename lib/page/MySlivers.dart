import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/3
/// 作者：Dawn
/// 不能放tabbar
class MySlivers extends StatefulWidget {
  MySlivers({Key key}) : super(key: key);

  @override
  _MySliversState createState() => _MySliversState();
}

class _MySliversState extends State<MySlivers>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: _getCustomerScrollview(),
    );
  }

  Widget _getCustomerScrollview() {
    return CustomScrollView(
      slivers: [
        _head(),
        _head(),
        _head(),
        _head(),
        _head(),
        _bar(),
        _head(),
        _head(),
        _getList(100),


      ],
    );
  }

  ///appBar
  Widget _bar() {
    final _tabs = <String>['TabA', 'TabB'];
    return SliverAppBar(
      //标题居中
      //展开高度
      //固定在顶部

      toolbarHeight:0,
      pinned: true,
      bottom: TabBar(
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: _tabs
            .map((tab) => Tab(text:tab))
            .toList(),
        controller: _tabController,
      ),
//      floating: true,
//    snap:true ,
    );
  }

  SliverToBoxAdapter _head() {
    // 将单个控件放入CustomScroView中
    return SliverToBoxAdapter(
      child: Container(
        height: 44.0,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.green),
      ),
    );
  }

  Widget _getList(childCount) {
    return SliverFixedExtentList(
        itemExtent: 50.0,
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          //创建列表项
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: new Text('list item $index'),
          );
        }, childCount: childCount //50个列表项;
            ));
  }

  Widget _getTabbarView(){
   return TabBarView(
     controller: _tabController,
     children: [
       _getList(100),
       _getList(50),
     ],
   );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

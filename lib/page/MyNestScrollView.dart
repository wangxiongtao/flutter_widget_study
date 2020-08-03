import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/page/MyBanner.dart';
import 'package:flutter_dawn_app/page/MyBottomNavigationBar.dart';
import 'package:flutter_dawn_app/page/nesttab/NestTabBarViewItem.dart';
import 'package:flutter_dawn_app/util/http/HttpUtil.dart';

class MyNestScrollView extends StatefulWidget {
  MyNestScrollView({Key key}) : super(key: key);

  @override
  _MyNestScrollviewState createState() => _MyNestScrollviewState();
}

class _MyNestScrollviewState extends State<MyNestScrollView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _tabs = <String>['TabA', 'TabB1'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: _getNestScrollView(),
    );
  }

  Widget _getNestScrollView() {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return _getHeadbuilder(context, innerBoxIsScrolled);
          },
          body: TabBarView(
            children: <Widget>[
              NestTabBarViewItem("1", TabPage1()),
              NestTabBarViewItem("2", Page2()),
            ],
          ),
//          body: TabBarView(
////            controller: _tabController,
//            // These are the contents of the tab views, below the tabs.
//            children: _tabs.map((String name) {
//              return SafeArea(
//                top: false,
//                bottom: false,
//                child: Builder(
//                  // This Builder is needed to provide a BuildContext that is
//                  // "inside" the NestedScrollView, so that
//                  // sliverOverlapAbsorberHandleFor() can find the
//                  // NestedScrollView.
//                  builder: (BuildContext context) {
//                    return CustomScrollView(
//                      // The "controller" and "primary" members should be left
//                      // unset, so that the NestedScrollView can control this
//                      // inner scroll view.
//                      // If the "controller" property is set, then this scroll
//                      // view will not be associated with the NestedScrollView.
//                      // The PageStorageKey should be unique to this ScrollView;
//                      // it allows the list to remember its scroll position when
//                      // the tab view is not on the screen.
//                      key: PageStorageKey<String>(name),
//                      slivers: <Widget>[
//                        SliverOverlapInjector(
//                          // This is the flip side of the SliverOverlapAbsorber
//                          // above.
//                          handle:
//                              NestedScrollView.sliverOverlapAbsorberHandleFor(
//                                  context),
//                        ),
//                        SliverPadding(
//                          padding: const EdgeInsets.all(8.0),
//                          // In this example, the inner scroll view has
//                          // fixed-height list items, hence the use of
//                          // SliverFixedExtentList. However, one could use any
//                          // sliver widget here, e.g. SliverList or SliverGrid.
//                          sliver: SliverFixedExtentList(
//                            // The items in this example are fixed to 48 pixels
//                            // high. This matches the Material Design spec for
//                            // ListTile widgets.
//                            itemExtent: 48.0,
//                            delegate: SliverChildBuilderDelegate(
//                              (BuildContext context, int index) {
//                                // This builder is called for each child.
//                                // In this example, we just number each list item.
//                                return ListTile(
//                                  title: Text('Item $index'),
//                                );
//                              },
//                              // The childCount of the SliverChildBuilderDelegate
//                              // specifies how many children this inner list
//                              // has. In this example, each tab has a list of
//                              // exactly 30 items, but this is arbitrary.
//                              childCount: 30,
//                            ),
//                          ),
//                        ),
//                      ],
//                    );
//                  },
//                ),
//              );
//            }).toList(),
//          ),
        )));
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
  SliverToBoxAdapter _head2() {
    // 将单个控件放入CustomScroView中
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 500,
        child: MyBanner(),
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

  Widget _getTabbarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(
          color: Colors.orange,
          child: _getList(100),
        ),
        Container(color: Colors.greenAccent),
      ],
    );
  }

  _getHeadbuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
//    _head2(),
      _head(),
      _head(),
      _head(),
      _head(),
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          pinned: true,
          toolbarHeight: 0,
          bottom: TabBar(
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
//            controller: _tabController,
          ),

//                floating: true,
//                snap: true,
//                expandedHeight: 200.0,
          forceElevated: innerBoxIsScrolled,
        ),
      )
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}




class TabPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTabPage1State();
  }


}

class MyTabPage1State extends State<TabPage1> {
  @override
    initState() {
    // TODO: implement initState
    super.initState();
    _toHttp();

  }

  _toHttp() async {
    Response response= await HttpUtil().post(HttpUtil.url,{"gggg":"asdsafdsafdsa"});
    print("==http==response==$response");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getList(10);
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

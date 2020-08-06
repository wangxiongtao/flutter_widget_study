import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/6
/// 作者：Dawn
class MyCustomScrollView extends StatefulWidget {
  MyCustomScrollView({Key key}) : super(key: key);

  @override
  _MyCustomerScrollViewState createState() => _MyCustomerScrollViewState();
}

class _MyCustomerScrollViewState extends State<MyCustomScrollView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _tabs = <String>['TabA', 'TabB1'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }
  _onRefresh() async{
    return await Future.delayed(Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: RefreshIndicator(
        onRefresh: (){
          return _onRefresh();
        },
        child: CustomScrollView(
          slivers: <Widget>[
            //AppBar，包含一个导航栏

            SliverAppBar(
              pinned: true,
              title: Text("1111"),
//            bottom: PreferredSize(
//              child: Text("FIX"),
//              preferredSize: Size.fromHeight(45),
//            ),
//            flexibleSpace: FlexibleSpaceBar(
//              title: const Text('Demo'),
//              background: Image.asset(
//                "./images/avatar.png", fit: BoxFit.cover,),
//            ),
            ),
//            SliverAppBar(
//
//              toolbarHeight: 0,
//              bottom: PreferredSize(
//                child:  TabBar(
//                  indicatorColor: Colors.black,
//                  indicatorSize: TabBarIndicatorSize.label,
//                  tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
//                  controller: _tabController,
//                ),
//                preferredSize: Size.fromHeight(100),
//              ),
////            flexibleSpace: FlexibleSpaceBar(
////              title: const Text('Demo'),
////              background: Image.asset(
////                "./images/avatar.png", fit: BoxFit.cover,),
////            ),
//            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    color: Colors.green,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.green,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.green,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.green,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Expanded(
                    child: new SliverFixedExtentList(
                      itemExtent: 50.0,
                      delegate: new SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            //创建列表项
                            if(index==0){
                              return   Text("1");
                            }else{
                              return new Container(
                                alignment: Alignment.center,
                                color: Colors.lightBlue[100 * (index % 9)],
                                child: new Text('list item $index'),
                              );
                            }

                          }, childCount: 100 //50个列表项
                      ),
                    ) ,
                  )

                ],
              ),
            ),


















          ],
        ) ,
      ),

    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

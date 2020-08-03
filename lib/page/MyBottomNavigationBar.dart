import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/2 
/// 作者：Dwan
class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({Key key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _index=0;
  List<Widget> _list=[
    Page1(),
    Page2(),
  ];
  PageController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: Column(
        children: [
          Expanded(
              child:PageView.builder(
                controller: _controller,
                  itemBuilder: (c,i){
                    return _list[i];
                  }
              )
          ),
          _getBottomBar()
        ],
      ),
    );
  }
  Widget _getBottomBar(){
    return BottomNavigationBar(
      type:BottomNavigationBarType.fixed,
      currentIndex: _index,
      onTap: (index)=>setState((){
        this._index=index;
        if(_controller!=null){
          _controller.jumpToPage(index);
        }

      }),
      items: [
        BottomNavigationBarItem(
          icon:Icon(Icons.home),
          title: Text("首页"),
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.print),
          title: Text("订单"),

        ),

      ],
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}






class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<Page1> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("==tabbar===Page1====initState==>");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverFixedExtentList(
        itemExtent: 50.0,
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          //创建列表项
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: new Text('list item $index'),
          );
        }, childCount: 50 //50个列表项;
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}



















class Page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState2();
  }
}

class MyState2 extends State<Page2> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("==tabbar===Page2====initState==>");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverFixedExtentList(
        itemExtent: 50.0,
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          //创建列表项
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: new Text('list item $index'),
          );
        }, childCount: 150 //50个列表项;
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
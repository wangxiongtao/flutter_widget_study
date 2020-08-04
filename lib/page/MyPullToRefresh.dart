import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 创建时间：2020/8/4 
/// 作者：Dwan
class MyPullToRefresh extends StatefulWidget {
  MyPullToRefresh({Key key}) : super(key: key);

  @override
  _MyPullToRefreshState createState() => _MyPullToRefreshState();
}

class _MyPullToRefreshState extends State<MyPullToRefresh> {
  List<String> list=["1"];
  ScrollController _scrollController;
  RefreshController refreshController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController();
    refreshController=RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body:_getRefresh()
    );
  }

 Widget _getRefresh(){
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => ClassicHeader(refreshStyle: RefreshStyle.Follow),
      footerBuilder: () => ClassicFooter(),
      enableLoadingWhenNoData: false,
      enableBallisticLoad:false,
      shouldFooterFollowWhenNotFull: (state) {
        // If you want load more with noMoreData state ,may be you should return false
        return false;
      },
      child: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        enablePullUp: true,
//        header: ClassicHeader(refreshStyle: RefreshStyle.Follow),
//        footer: ClassicFooter(loadStyle: LoadStyle.ShowWhenLoading,),
        onRefresh: _onRefresh,
        onLoading: () {
          _onLoadMore();
        },

        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (c,i){
              return ListTile(
                title: Text("title===>${list[i]}"),
              );
            }
        ),
      ),
    );
  }


  _onRefresh() async{
    print("onRefresh-------------------------");
    await Future.delayed(Duration(milliseconds: 1000));

//       print("onRefresh--success");
//       if (mounted) setState(() {});
    setState(() {
      list.add("value");
      list.add("value");
      list.add("value");
      list.add("value");
      list.add("value");
      list.add("value");
      list.add("value");
      refreshController.refreshCompleted();
      print('延时3s执行--------------------------');
    });


//     Future.delayed(Duration(milliseconds: 5000)).then((_){
//       list.add("value");
//       print("onRefresh--success");
//       if (mounted) setState(() {});
//       refreshController.refreshCompleted();
//
//     }
//     );

  }
  _onLoadMore() async{
    print('_onLoadMore--------------------------');
    await Future.delayed(Duration(milliseconds: 3000));
    setState(() {
      list.add("value++");
      refreshController.loadComplete();
      print('延时3s执行--------------------------');
    });
  }

  Widget _getListView(){
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (c,i){
          return ListTile(
            title: Text("title===>${list[i]}"),
          );
        }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
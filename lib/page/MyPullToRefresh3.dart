import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/page/MyNestScrollView.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:frefresh/frefresh.dart';

/// 创建时间：2020/8/6 
/// 作者：Dawn
class MyPullToRefresh3 extends StatefulWidget {
  MyPullToRefresh3({Key key}) : super(key: key);

  @override
  _MyPullToRefresh3State createState() => _MyPullToRefresh3State();
}

class _MyPullToRefresh3State extends State<MyPullToRefresh3> {
  FRefreshController controller1;
  List<String>list=List.generate(20, (index) => "Qitem3==${index}");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1 = FRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
     body: FRefresh(
       controller: controller1,
       header: Container(
         width: 75.0,
         height: 75.0,
         clipBehavior: Clip.antiAlias,
         decoration: BoxDecoration(),
         child: OverflowBox(
           maxHeight: 100.0,
           maxWidth: 100.0,
           child: Image.asset(
             "images/icon_logo.png",
             width: 100.0,
             height: 100.0,
             fit: BoxFit.fitHeight,
           ),
         ),
       ),
       headerHeight: 75.0,
       child: getListView(),
       onRefresh:_onRefresh,
     ),
    );
  }
  _onRefresh() async{
     await Future.delayed(Duration(seconds: 2));
    controller1.finishRefresh();
  }

  Widget getListView(){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (c,i){
        return ListTile(
          title: Text(list[i]),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
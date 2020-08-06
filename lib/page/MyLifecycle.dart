
import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/util/RouteObserverUtil.dart';
import 'package:flutter_dawn_app/util/my_lifecycle_state.dart';

import '../main.dart';


/// 创建时间：2020/8/5 
/// 作者：Dawn
class MyLifecycle extends StatefulWidget{
  MyLifecycle({Key key}) : super(key: key);

  @override
  _MyLifecycleState createState() => _MyLifecycleState();
}

class _MyLifecycleState extends State<MyLifecycle> with RouteAware{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      print(" AppLifecycleState单次 Frame 绘制回调"); // 只回调一次
    });
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
//      print(" AppLifecycleState实时 Frame 绘制回调"); //  每帧都回调
    });

    print("==AppLifecycleState===>initState");
//    var dio=HttpUtil().dio;
//    final api = RestClient(dio);
//    api.getTags();


  }
  _TestState() {
    addLifecycleObserver(){

    }
//    addLifecycleObserver((phase){
//      if(phase == StateLifecyclePhase.initState) {
//        setState((){
//          n = 2;
//        });
//      }
//    });
//
//    int n = 1;
  }



//  @override
//  void didPageView() {
//    super.didPageView();
//    // 发送页面露出事件
//    print("==AppLifecycleState===>didPageView");
//  }
//
//  @override
//  void didPageExit() {
//    super.didPageExit();
//    // 发送页面离开事件
//    print("==AppLifecycleState===>didPageExit");
//  }






//  @override
//  Future<bool> didPopRoute() {
//    // TODO: implement didPopRoute
//    print("==AppLifecycleState===>didPopRoute");
//    return super.didPopRoute();
//  }
//  @override
//  Future<bool> didPushRoute(String route) {
//    // TODO: implement didPushRoute
//    print("==AppLifecycleState===>didPushRoute==$route");
//    return super.didPushRoute(route);
//  }

// @override
//  void onShow() {
//    // TODO: implement onShow
//    super.onShow();
//    print("==AppLifecycleState===>onShow");
//  }
//  @override
//  void onAppBackground() {
//    // TODO: implement onAppBackground
//    super.onAppBackground();
//    print("==AppLifecycleState===>onAppBackground");
//  }
//  @override
//  void onAppForeground() {
//    // TODO: implement onAppForeground
//    super.onAppForeground();
//    print("==AppLifecycleState===>onAppForeground");
//  }
//  @override
//  void onHide() {
//    // TODO: implement onHide
//    super.onHide();
//    print("==AppLifecycleState===>onHide");
//  }
  @override
  Widget build(BuildContext context) {
    print("==AppLifecycleState===>build==${RouteObserverUtil.routeObserver}");
    return BaseMaterialApp(

      body: RaisedButton(
        child:Text("1111") ,
        onPressed:(){
          Navigator.of(context).pushNamed("/MyRouter");
        },
      ),
    );
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("==AppLifecycleState===>didChangeDependencies");
    MyList.observer.subscribe(this, ModalRoute.of(context)); //
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("==AppLifecycleState===>deactivate");
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("==AppLifecycleState===>dispose");

  }
  @override
  void didPush() {
    // TODO: implement didPush
    super.didPush();
    print("==AppLifecycleState===>didPush");
  }
  @override
  void didPop() {
    // TODO: implement didPop
    super.didPop();
    print("==AppLifecycleState===>didPop");
  }
  @override
  void didPopNext() {
    // TODO: implement didPopNext
    super.didPopNext();
    print("==AppLifecycleState===>didPopNext");
  }
  @override
  void didPushNext() {
    // TODO: implement didPushNext
    super.didPushNext();
    print("==AppLifecycleState===>didPushNext");
  }

}
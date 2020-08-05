import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dawn_app/page/MyBanner.dart';
import 'package:flutter_dawn_app/page/MyBottomBar.dart';
import 'package:flutter_dawn_app/page/MyBottomNavigationBar.dart';
import 'package:flutter_dawn_app/page/MyButton.dart';
import 'package:flutter_dawn_app/page/MyContainer.dart';
import 'package:flutter_dawn_app/page/MyCustomerTabBar.dart';
import 'package:flutter_dawn_app/page/MyDialog.dart';
import 'package:flutter_dawn_app/page/MyGridView.dart';
import 'package:flutter_dawn_app/page/MyIcon.dart';
import 'package:flutter_dawn_app/page/MyImage.dart';
import 'package:flutter_dawn_app/page/MyInheritedWidget.dart';
import 'package:flutter_dawn_app/page/MyInput.dart';
import 'package:flutter_dawn_app/page/MyLifecycle.dart';
import 'package:flutter_dawn_app/page/MyListView.dart';
import 'package:flutter_dawn_app/page/MyNestScrollView.dart';
import 'package:flutter_dawn_app/page/MyProgressIndicator.dart';
import 'package:flutter_dawn_app/page/MyProvider.dart';
import 'package:flutter_dawn_app/page/MyPullToRefresh.dart';
import 'package:flutter_dawn_app/page/MyRouter.dart';
import 'package:flutter_dawn_app/page/MySlivers.dart';
import 'package:flutter_dawn_app/page/MySomeBox.dart';
import 'package:flutter_dawn_app/page/MyTabBar.dart';
import 'package:flutter_dawn_app/page/MyTabBarDefault.dart';
import 'package:flutter_dawn_app/page/MyText.dart';
import 'package:flutter_dawn_app/util/RouteObserverUtil.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';
import 'package:flutter_dawn_app/util/my_lifecycle_state.dart';
import 'package:flutter_page_tracker/flutter_page_tracker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_life_cycle/page_life_cycle.dart';

void main() {
//  debugPaintSizeEnabled=true;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(new MyList());
}

class MyList extends StatelessWidget with RouteAware{
  final List<String> list=[];
  static final RouteObserver observer=new RouteObserver();
  MyList(){
    list.add("MyContainer");
    list.add("MyText");
    list.add("MyImage");
    list.add("MyICon");
    list.add("MyButton");
    list.add("MyListView");
    list.add("MyGridView");
    list.add("MyInput");
    list.add("MyTabBar");
    list.add("MyTabBarDefault");
    list.add("MyCustomerTabBar");
    list.add("轮播图组件");
    list.add("MyBottomNavigationBar");
    list.add("MyBottomBar");
    list.add("MySomeBox");
    list.add("MyProgressIndicator");
    list.add("Slivers组件");
    list.add("MyNestScrollView");
    list.add("MyInheritedWidget");
    list.add("Provider跨组件状态共享");
    list.add("MyDialog");
    list.add("下拉刷新组件");
    list.add("router-页面跳转以及返回");
    list.add("MyLifecycle");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
//        navigatorObservers: [PageNavigatorObserver()],
      navigatorObservers: [observer],
        routes:<String, WidgetBuilder>{
          '/MyRouter': (BuildContext context) => MyRouter(),
          '/MiddlePage': (BuildContext context) => MiddlePage(),
          '/MyLifecycle': (BuildContext context) => MyLifecycle(),
        },
      home: Scaffold(
        appBar: new AppBar(title: new Text("DEMO"),backgroundColor:Colors.orangeAccent),
        body:WillPopScope(
            child: _getListView(),
          onWillPop: ()async{
              ToastUtil.toast("clickBack");
            return false;//false不执行返回操作
          },
        ) ,
      ),
    );
  }
  Widget _getListView(){
    return ListView.separated(
        itemCount:list.length,
        separatorBuilder:(context, index){
          return Divider(color: Colors.blue,height: 5,thickness:5);
        },
        itemBuilder: (context, index){
          String item=list[index];
          Widget w=InkWell(
              onTap: ()=>{
                _clickItem(context,index)
              },
              child: Container(
                height: 50,
                alignment: Alignment(-1,0),

                child: Text(item,style:TextStyle(backgroundColor: Colors.deepOrangeAccent),),
              )
          );
          return w;
        });
  }

  @override
  void didPush() {
    // TODO: implement didPush
    super.didPush();
    print("==AppLifecycleState===>didPush");
  }


}



_clickItem(BuildContext context,int index){
  Fluttertoast.showToast(msg:"index==${index}");
  WidgetBuilder builder;
  switch(index){
    case 0:
      builder=(context)=>new MyContainer();
      break;
    case 1:
      builder=(context)=>new MyText();
      break;
    case 2:
      builder=(context)=>new MyImage();
      break;
    case 3:
      builder=(context)=>new MyIcon();
      break;
    case 4:
      builder=(context)=>new MyButton();
      break;
    case 5:
      builder=(context)=>new MyListView();
      break;
    case 6:
      builder=(context)=>new MyGridView();
      break;
    case 7:
      builder=(context)=>new MyInput();
      break;
    case 8:
      builder=(context)=>new MyTabBar();
      break;
    case 9:
      builder=(context)=>new MyTabBarDefault();
      break;
    case 10:
      builder=(context)=>new MyCustomerTabBar();
      break;
    case 11:
      builder=(context)=>new MyBanner();
      break;
    case 12:
      builder=(context)=>new MyBottomNavigationBar();
      break;
    case 13:
      builder=(context)=>MyBottomBar();
      break;
    case 14:
      builder=(context)=>MySomeBox();
      break;
    case 15:
      builder=(context)=>MyProgressIndicator();
      break;
    case 16:
      builder=(context)=>MySlivers();
      break;
    case 17:
      builder=(context)=>MyNestScrollView();
      break;
    case 18:
      builder=(context)=>MyInheritedWidget();
      break;
    case 19:
      builder=(context)=>MyProvider();
      break;
    case 20:
      builder=(context)=>MyDialog();
      break;
    case 21:
      builder=(context)=>MyPullToRefresh();
      break;
    case 22:
      builder=(context)=>MyRouter();
//      Navigator.pushNamed(context, "/MyRouter");
      break;
    case 23:
      builder=(context)=>MyLifecycle();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
  }
  Navigator.push(context, new MaterialPageRoute(builder: builder));
}
class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Container();
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



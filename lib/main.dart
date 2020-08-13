import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dawn_app/model/ShowCount.dart';
import 'package:flutter_dawn_app/page/Login.dart';
import 'package:flutter_dawn_app/page/MyAnimation.dart';
import 'package:flutter_dawn_app/page/MyBanner.dart';
import 'package:flutter_dawn_app/page/MyBottomBar.dart';
import 'package:flutter_dawn_app/page/MyBottomNavigationBar.dart';
import 'package:flutter_dawn_app/page/MyButton.dart';
import 'package:flutter_dawn_app/page/MyContainer.dart';
import 'package:flutter_dawn_app/page/MyCustomScrollView.dart';
import 'package:flutter_dawn_app/page/MyCustomerTabBar.dart';
import 'package:flutter_dawn_app/page/MyCustomerWidget.dart';
import 'package:flutter_dawn_app/page/MyDialog.dart';
import 'package:flutter_dawn_app/page/MyFluro.dart';
import 'package:flutter_dawn_app/page/MyGridView.dart';
import 'package:flutter_dawn_app/page/MyIcon.dart';
import 'package:flutter_dawn_app/page/MyImage.dart';
import 'package:flutter_dawn_app/page/MyInheritedWidget.dart';
import 'package:flutter_dawn_app/page/MyInput.dart';
import 'package:flutter_dawn_app/page/MyJson.dart';
import 'package:flutter_dawn_app/page/MyLifecycle.dart';
import 'package:flutter_dawn_app/page/MyListView.dart';
import 'package:flutter_dawn_app/page/MyNestScrollView.dart';
import 'package:flutter_dawn_app/page/MyNotice.dart';
import 'package:flutter_dawn_app/page/MyProgressIndicator.dart';
import 'package:flutter_dawn_app/page/MyProvider.dart';
import 'package:flutter_dawn_app/page/MyProvider2.dart';
import 'package:flutter_dawn_app/page/MyPullToRefresh.dart';
import 'package:flutter_dawn_app/page/MyPullToRefresh2.dart';
import 'package:flutter_dawn_app/page/MyRouter.dart';
import 'package:flutter_dawn_app/page/MySlivers.dart';
import 'package:flutter_dawn_app/page/MySomeBox.dart';
import 'package:flutter_dawn_app/page/MyStream.dart';
import 'package:flutter_dawn_app/page/MyTabBar.dart';
import 'package:flutter_dawn_app/page/MyTabBarDefault.dart';
import 'package:flutter_dawn_app/page/MyDraggableScrollableSheet.dart';
import 'package:flutter_dawn_app/page/MyText.dart';
import 'package:flutter_dawn_app/page/MyTouchEvent.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

void main() {
  _startMethod();
  _method_C();
//  debugPaintSizeEnabled=true;
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ShowCount()),
      ],
      child: MyList(),
    ),
  );
}

_startMethod() async {
  _method_A();
  await _method_B();
  print("start结束");
}

_method_A() {
  print("A开始执行这个方法~");
}

_method_B() async {
  print("B开始执行这个方法~");
  await print("后面执行这句话~");
  print("继续执行这句哈11111~");
}

_method_C() {
  print("C开始");
}

class MyList extends StatelessWidget with RouteAware {
  final List<String> list = [];
  static final RouteObserver observer = new RouteObserver();

  MyList() {
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
    list.add("MyProvider2");
    list.add("MyCustomScrollView");
    list.add("MyTouchEvent");
    list.add("MyNotice");
    list.add("fluro");
    list.add("JSON学习,组件的key");
    list.add("MyAnimation");
    list.add("MyCustomerWidget");
    list.add("MyStream");
    list.add("Login");
    list.add("DraggableScrollableSheet");
    list.add("弹出透明高斯模糊图层");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShareMyDataWidget(
        11,
        MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.deepPurple,
              indicatorColor: Colors.deepOrangeAccent,
              textSelectionColor: Colors.deepOrangeAccent,
              cursorColor: Colors.deepOrangeAccent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              buttonTheme: ButtonThemeData(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              tabBarTheme: TabBarTheme(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.deepOrangeAccent,
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: Colors.black87,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
//        navigatorObservers: [PageNavigatorObserver()],
          navigatorObservers: [observer],
          routes: <String, WidgetBuilder>{
            '/MyRouter': (BuildContext context) => MyRouter(),
            '/MiddlePage': (BuildContext context) => MiddlePage(),
            '/MyLifecycle': (BuildContext context) => MyLifecycle(),
            '/MyPullToRefresh': (BuildContext context) => MyPullToRefresh2(),
          },
          home: Scaffold(
            appBar: new AppBar(
                title: new Text("DEMO"), backgroundColor: Colors.orangeAccent),
            body: WillPopScope(
              child: _getListView(),
              onWillPop: () async {
                ToastUtil.toast("clickBack");
                return true; //false不执行返回操作
              },
            ),
          ),
        ));
  }

  Widget _getListView() {
    return ListView.separated(
        itemCount: list.length,
        separatorBuilder: (context, index) {
          return Divider(color: Colors.blue, height: 5, thickness: 5);
        },
        itemBuilder: (context, index) {
          String item = list[index];
          Widget w = InkWell(
              onTap: () => {_clickItem(context, index)},
              child: Container(
                height: 50,
                alignment: Alignment(-1, 0),
                child: Text(
                  item + "====${Provider.of<ShowCount>(context).count}",
                  style: TextStyle(backgroundColor: Colors.deepOrangeAccent),
                ),
              ));
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

open35(context) {
  Navigator.of(context).push(PageRouteBuilder(
//      transitionDuration: Duration(milliseconds: 300),
      opaque: false,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        var tween = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));
        return SlideTransition(
          position: tween.animate(animation),
          child: Material(
            color: Colors.transparent,
            child:ClipRect(
              child:  BackdropFilter(
                filter: new ImageFilter.blur(sigmaX:15, sigmaY: 15),
                child: Text("11111"),
              ),
            ),
          ),
//          child: BackdropFilter(
//              filter: new ImageFilter.blur(sigmaX:100, sigmaY: 100),
//              child: Material(
//                color: Colors.transparent,
//                child: Text("1111"),
//              )
//          ),
        );
      }));
}

_clickItem(BuildContext context, int index) {
  Fluttertoast.showToast(msg: "index==${index}");
  if (index == 35) {
    open35(context);
    return;
  }
  WidgetBuilder builder;
  switch (index) {
    case 0:
      builder = (context) => new MyContainer();
      break;
    case 1:
      builder = (context) => new MyText();
      break;
    case 2:
      builder = (context) => new MyImage();
      break;
    case 3:
      builder = (context) => new MyIcon();
      break;
    case 4:
      builder = (context) => new MyButton();
      break;
    case 5:
      builder = (context) => new MyListView();
      break;
    case 6:
      builder = (context) => new MyGridView();
      break;
    case 7:
      builder = (context) => new MyInput();
      break;
    case 8:
      builder = (context) => new MyTabBar();
      break;
    case 9:
      builder = (context) => new MyTabBarDefault();
      break;
    case 10:
      builder = (context) => new MyCustomerTabBar();
      break;
    case 11:
      builder = (context) => new MyBanner();
      break;
    case 12:
      builder = (context) => new MyBottomNavigationBar();
      break;
    case 13:
      builder = (context) => MyBottomBar();
      break;
    case 14:
      builder = (context) => MySomeBox();
      break;
    case 15:
      builder = (context) => MyProgressIndicator();
      break;
    case 16:
      builder = (context) => MySlivers();
      break;
    case 17:
      builder = (context) => MyNestScrollView();
      break;
    case 18:
      builder = (context) => MyInheritedWidget();
      break;
    case 19:
      builder = (context) => MyProvider();
      break;
    case 20:
      builder = (context) => MyDialog();
      break;
    case 21:
      builder = (context) => MyPullToRefresh();
      break;
    case 22:
      builder = (context) => MyRouter();
//      Navigator.pushNamed(context, "/MyRouter");
      break;
    case 23:
      builder = (context) => MyLifecycle();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 24:
      builder = (context) => MyProvider2();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 25:
      builder = (context) => MyCustomScrollView();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 26:
      builder = (context) => MyTouchEvent();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 27:
      builder = (context) => MyNotice();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 28:
      builder = (context) => MyFluro("1111");
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 29:
      builder = (context) => MyJson();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 30:
      builder = (context) => MyAnimation();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 31:
      builder = (context) => MyCustomerWidget();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 32:
      builder = (context) => MyStream();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 33:
      builder = (context) => Login();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
    case 34:
      builder = (context) => MyDraggableScrollableSheet();
//      Navigator.pushNamed(context, "/MyLifecycle");
      break;
  }
  Navigator.push(context, CupertinoPageRoute(builder: builder))
      .then((value) => ToastUtil.toast(value));
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

class MyTranst extends StatefulWidget {
  @override
  _MyTranstState createState() => _MyTranstState();
}

class _MyTranstState extends State<MyTranst> with TickerProviderStateMixin {
  AnimationController animationC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationC = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animationC.forward();
  }

  @override
  Widget build(BuildContext context) {
    var tween = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));
    return SlideTransition(
      position: tween.animate(animationC),
      child: Material(
        color: Colors.transparent,
        child: ClipRect(
          // <-- clips to the 200x200 [Container] below
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 100.0,
              sigmaY: 100.0,
            ),
            child: Container(
              alignment: Alignment.center,
//                    width: 200.0,
//                    height: 200.0,
              child: Text('Hello World'),
            ),
          ),
        ),
//        child: Stack(
//          fit: StackFit.expand,
//          children: <Widget>[
//            Text('0' * 10000),
//
//          ],
//        ),
//        child: Text("1111"),
//        child:Stack(
//          children: <Widget>[
//            Positioned(
//              top: 500,
//              bottom: 0,
//              left: 0,
//              right: 0,
//              child: SizedBox(
//                height: 100,
//                width: 100,
//                child: BackdropFilter(
//                  filter: new ImageFilter.blur(sigmaX:100, sigmaY: 100),
//                  child: SizedBox(
//                    height: 100,
//                    width: 100,
//                    child: Text("11111"),
//                  ),
//                ),
//              ),
//            ),
//            Text("asdsadsadsa")
//          ],
//        ),
      ),
    );
  }
}

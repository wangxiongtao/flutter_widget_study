import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/8/4
/// 作者：Dawn
class MyProvider extends StatefulWidget {
  MyProvider({Key key}) : super(key: key);

  @override
  _MyProviderState createState() => _MyProviderState();
}

class _MyProviderState extends State<MyProvider> {
  String data;
  NotifyData notifyData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyData = new NotifyData();
    notifyData.addListener(() {
      print("==MyProvider===addListener==>");
      setState(() {
        print("==MyProvider===setState==>");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_MyProviderState======build");
    return BaseMaterialApp(
        body: MyNotifyWidget(
            notifyData: NotifyData(),
            child: Column(
              children: [
                Builder(builder: (context) {
                  print("RaisedButton2======build");
                  return RaisedButton(
                    child: Text("click9=====${of(context).data.notifyData}"),
                  );
                }),
                Builder(builder: (context) {
                  print("RaisedButton1======build");
                  return RaisedButton(
                    child: Text("click9====="),
                    onPressed: () {
                      of(context,false).data.changeData("notifyData1344");
                    },
                  );
                })
              ],
            )));
  }

  MyShareData of(BuildContext context, [bool build = true]) {
//    return context
//        .getElementForInheritedWidgetOfExactType<MyShareData>()
//        .widget;
    if (build) {
      return context.dependOnInheritedWidgetOfExactType<MyShareData>();
    }
    return context
        .getElementForInheritedWidgetOfExactType<MyShareData>()
        .widget;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class MyNotifyWidget extends StatefulWidget {
  final NotifyData notifyData;
  final Widget child;

  const MyNotifyWidget({Key key, this.notifyData, this.child})
      : super(key: key);

  @override
  _MyNotifyWidgetState createState() => _MyNotifyWidgetState();
}

class _MyNotifyWidgetState extends State<MyNotifyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.notifyData.addListener(() {
      setState(() {
        print("Notify===setState===");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Notify===build===");
    return MyShareData(data: widget.notifyData, child: widget.child);
  }
}

class MyShareData extends InheritedWidget {
  final NotifyData data;
  final Widget child;

  MyShareData({@required this.data, this.child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

class NotifyData extends ChangeNotifier {
  String notifyData;

  void changeData(String notifyData) {
    this.notifyData = notifyData;
    print("hasListeners======$hasListeners");
    notifyListeners();
  }
}

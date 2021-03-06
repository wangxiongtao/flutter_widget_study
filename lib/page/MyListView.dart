import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 创建时间：2020/7/30
/// 作者：Dawn

class DataBean {
  String title;
  String name;

  DataBean(this.title, this.name);

  p() {
    print("==========1" + this.title);
  }

  p1() {
    print("==========p1");
  }
}

class MyListView extends StatefulWidget {
  MyListView({Key key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  final List<DataBean> list = [];
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("_controller===$_controller}"); //打印滚动位置
    _controller.addListener(() {
//      / _scrollController.offset表示ListView当前滑动的距离
//      // _scrollController.position.maxScrollExtent表示ListView可以滑动的最大距离
//      // offset >= maxScrollExtent就表示ListView已经滑动到了底部
      print("_controller.offset..1111===${_controller.offset}"); //打印滚动位置
      print(
          "_controller.offset..底部位置===${_controller.position.maxScrollExtent}");

      Fluttertoast.showToast(msg: "滑动的距离==${_controller.offset}");
      setState(() {
        setText();
      });
//      if (_controller.offset < 1000 && showToTopBtn) {
//        setState(() {
//          showToTopBtn = false;
//        });
//      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
//        setState(() {
//          showToTopBtn = true;
//        });
//      }
    });
    initList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: Column(
        children: [
          RaisedButton(
            child: Text(
              "${text}\n固定头部",
              style: TextStyle(height: 2),
            ),
            onPressed: () => {
              setState(() {
                addList();
//                list.insert(0, DataBean("title123", "namekkkk"));
              })
            },
          ),
          RaisedButton(
            child: Text(
              "回到头部",
              style: TextStyle(height: 2),
            ),
            onPressed: () => {
              _controller.animateTo(10,
                  duration: Duration(milliseconds: 200), curve: Curves.ease)
            },
          ),
          Divider(color: Colors.orange, height: 10, thickness: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _getListView(_controller),
                ),
                Expanded(
                    child: NotificationListener(
                        child: _getListView(),
                        onNotification: (notification) {
                          double progress = notification.metrics.pixels /
                              notification.metrics.maxScrollExtent;
                          print(
                              "_controller.progress..1111===${progress}"); //打印滚动位置
                          print(
                              "_controller.maxScrollExtent..1111===${notification.metrics.maxScrollExtent}"); //打印滚动位置
                          switch (notification.runtimeType) {
                            case ScrollStartNotification:
                              print("开始滚动");
                              break;
                            case ScrollUpdateNotification:
                              print("正在滚动");
                              break;
                            case ScrollEndNotification:
                              print("滚动停止");
                              break;
                            case OverscrollNotification:
                              print("滚动到边界");
                              break;
                          }
                          return false;
//
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addList() {
    print("==setState==addList===");
    list.insert(0, null);
  }

  void setText() {
    print("==setState==setText===");
    text = "${_controller.offset}";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  Widget _getListView([ScrollController controller]) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.red, height: 0, thickness: 0);
      },
      itemCount: list.length,
      itemBuilder: (context, index) => _getItemBuilder(list[index]),
      controller: controller,
    );
  }

  Widget _getItemBuilder(DataBean bean) {
    return Text("${bean?.name}-----${bean?.title}",
        style: TextStyle(height: 5));
  }

  void initList() {
    DataBean d = DataBean("title123", "name");
    d
      ..title = "111000111444"
      ..name = "rrrr"
      ..p();
    print("==========");
    print(d?.title);

    for (int i = 0; i < 100; i++) {
      list.add(DataBean("title$i", "name$i"));
    }
  }
}

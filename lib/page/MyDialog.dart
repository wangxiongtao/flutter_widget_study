
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/page/MyNotice.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';

/// 创建时间：2020/8/4
/// 作者：Dawn
class MyDialog extends StatefulWidget {
  MyDialog({Key key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
      body: Column(
        children: [
          RaisedButton(
              child: Text("AlertDialog"),
              onPressed: () {
                showDeleteConfirmDialog1();
              }),
          RaisedButton(
              child: Text("showCustomerDialog"),
              onPressed: () {
                showCustomerDialog();
              }),
          RaisedButton(
              child: Text("showCustomerDialog1"),
              onPressed: () {
                showCustomerDialog1();
              }),
          RaisedButton(
              child: Text("底部"),
              onPressed: () {
                _showModalBottomSheet();
              }),
          RaisedButton(
              child: Text("全屏"),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation){
                  return Scaffold(
                    backgroundColor:Colors.transparent ,
                    body: Text("11111"),
                  );
                },
//                  fullscreenDialog: true,
                  opaque: false,
                  barrierDismissible: false
                ));
              }),
        ],
      ),
    );
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  showCustomerDialog() {
    Dialog dialog = Dialog(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Text("12345"),
          CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: Colors.white38,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ],
      ),
    );

    showDialog(
        context: context,
        builder: (c) => UnconstrainedBox(
          constrainedAxis: Axis.vertical,
              child: SizedBox(
                width: 200,
                child: dialog,
              ),
            ));
  }
  showCustomerDialog1() {
    Dialog dialog = Dialog(
      child: MyShowDialog(),
    );

    showDialog(
        context: context,
        builder: (c) => MyShowDialog());
  }

  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 1000,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("11234"),
              SizedBox(height: 10,),
              Text("1eeeee"),
              SizedBox(height: 10,),
              Text("11"),
              SizedBox(height: 10,),
            ],
          ),
        );
//        return ListView.builder(
//          itemCount: 2,
//          itemBuilder: (BuildContext context, int index) {
//            return ListTile(
//              title: Text("$index"),
//              onTap: () => Navigator.of(context).pop(index),
//            );
//          },
//        );
      },
    );
  }
  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}












class MyShowDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text("1111WEWQEWQEWQ"),

    );
//    return Material(
//      color: Colors.transparent,
//      child: MediaQuery.removePadding(
//        removeTop: true,
//          context: context,
//          child: Text("32321esaedad")),
//    );
  }
}




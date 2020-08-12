import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:path_provider/path_provider.dart';

/// 创建时间：2020/8/11 
/// 作者：Dawn
class MyCustomerWidget extends StatefulWidget {
  MyCustomerWidget({Key key}) : super(key: key);

  @override
  _MyCustomerWidgetState createState() => _MyCustomerWidgetState();
}

class _MyCustomerWidgetState extends State<MyCustomerWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPath();

  }
  getPath() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    print("==tempDir====>$tempDir");

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print("==appDocPath====>$appDocPath");
    _incrementCounter();
    _getLocalFile1();
    _readCounter();


    RegExp exp = new RegExp(r"(\d+)");
    String string="111";
    print("pattern1==========>"+exp.pattern);
    print("pattern2==========>${exp.hasMatch("11111")}");








  }


  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getExternalStorageDirectory()).path;
    return new File('$dir/counter.txt');
  }
  Future<File> _getLocalFile1() async {
    // 获取应用目录
    String dir = (await getExternalStorageDirectory()).path;
    String dir1 = (await getApplicationSupportDirectory()).path;
    print("==_getLocalFile1====>$dir");
    print("==_getLocalFile1====>$dir1");
    return new File('$dir/counter.txt');
  }
  Future<Null> _incrementCounter() async {
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString("adasdsadsa11111111");
  }

  Future<String> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // read the variable as a string from the file.
      String contents = await file.readAsString();
      print("==_readCounter====>$contents");
      return contents;
    } on FileSystemException {
      print("==_readCounter====>error");
      return "1111";
    }
  }


  @override
  Widget build(BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    double width= MediaQuery.of(context).size.height;
    print("==media====wwww=>$w");
    print("==media====wwww=>$width");
    return BaseMaterialApp(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomPaint(
            painter: MyPainter(),
            size: Size(100, 100), //指定画布大小
          ),
          CustomPaint(
            painter: MyLinePainter(),
            size: Size(100, 100), //指定画布大小
          ),
          Text("${DateTime.now()}"),
          Text("DateTime转时间戳===>${DateTime.now().millisecondsSinceEpoch}"),
          Text("时间戳转DateTime===>DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)"),
          Text("DateTime -->formatString: -->${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())}"),

        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

















class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0x77cdb175); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);


    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}






















class MyLinePainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round//画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(0, 0), Offset(100,100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}
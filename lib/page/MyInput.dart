import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/7/31
/// 作者：Dawn
/// https://www.cnblogs.com/lxlx1798/p/11064208.html
class MyInput extends StatefulWidget {
  MyInput({Key key}) : super(key: key);

  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
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
          TextField(
            textInputAction: TextInputAction.search,
            autocorrect: false,
            // 是否自动校正
            autofocus: false,
            //自动获取焦点
            enabled: true,
            // 是否启用
//            inputFormatters: [],
            //对输入的文字进行限制和校验
//            keyboardType: TextInputType.text,
            //获取焦点时,启用的键盘类型
            maxLines: 1,
            // 输入框最大的显示行数
//            maxLength: 3,
            //允许输入的字符长度/
            maxLengthEnforced: false,
            //是否允许输入的字符长度超过限定的字符长度
//            obscureText: true,
            // 是否隐藏输入的内容
            onChanged: (newValue) {
              print("input==onChanged=====" + newValue); // 当输入内容变更时,如何处理
            },
            onSubmitted: (value) {
              print("input===onSubmitted=====>" + value); // 当用户确定已经完成编辑时触发
            },
//            style: new TextStyle(color: new Color(Colors.amberAccent.green)),
            // 设置字体样式
//            textAlign: TextAlign.center,
            //输入的内容在水平方向如何显示
            decoration: new InputDecoration(
//                labelText: "城市",
//                icon: new Icon(Icons.location_city),
//                border: new OutlineInputBorder(),
              // 边框样式
//                helperText: 'required',
              hintText: '请选择你要投保的城市',
//                prefixIcon: new Icon(Icons.android),
//                prefixText: 'Hello'
            ),
          )
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

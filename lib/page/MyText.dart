import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';


//style: new TextStyle(
////背景颜色，但是这样设置背景有些文本显示貌似会有点问题，值为一个 Paint 对象
////background: backgroundPaint,
////文字颜色，值为一个 Color 对象
//color: new Color(0xFF000000),
///**
// * 添加装饰物，可选值有：
// * TextDecoration.none：无，默认
// * TextDecoration.overline：上划线
// * TextDecoration.lineThrough：删除线
// * TextDecoration.underline：下划线
// * 也可以调用 TextDecoration.combine() 方法传入一个集合设置多个装饰
// */
//decoration: TextDecoration.underline,
////设置装饰物的颜色，值为一个 Color 对象
//decorationColor: new Color(0xFF00FFFF),
///**
// * 设置装饰物的样式，可选值有：
// * TextDecorationStyle.dashed：装饰线为虚线
// * TextDecorationStyle.dotted ：装饰线为点构成的线
// * TextDecorationStyle.double ：装饰线为两根线
// * TextDecorationStyle.solid ：装饰线为实心线
// * TextDecorationStyle.wavy ：装饰线为波浪线
// * 也可以 TextDecorationStyle.values() 方法传入一个集合设置多种样式
// */
//decorationStyle: TextDecorationStyle.dashed,
////自定义字体的名字，搭配 package 属性使用
////fontFamily: ,
////自定义字体的路径
////package: ,
////字体大小，值为 double 类型
//fontSize: 20.0,
///*
//               * 字体样式，可选值有：
//               * FontStyle.italic：斜体
//               * FontStyle.normal：正常
//               */
//fontStyle: FontStyle.italic,
////字体字重，常用值有 FontWeight.bold（加粗）
//fontWeight: FontWeight.bold,
///**
// * 貌似文档中的意思是是否使用父类的样式来替换空值（没有设置的值）
// * 如果为 true 则使用父类的样式来替换控制
// * 如果为 false，则恢复成默认值，白色 10px，字体为 sans-serif
// */
//inherit: false,
////字间距，值为 double 类型
//letterSpacing: 2.0,
///**
// * 感觉是设置文字所属区域，可能跟字体有关
// * locale
// * 文字阴影，值为一个 Shadow 集合
// */
//shadows: shadowList,
///**
// * 文本基线，这个不太理解，感觉用到的情况应该也不多，可选值有两个
// * TextBaseline.ideographic：用于对齐字母字符的字形底部的水平线
// * TextBaseline.alphabetic：用于对齐表意字符的水平线
// * 也可以 TextBaseline.values() 方法传入一个集合设置多个基线
// */
//textBaseline: TextBaseline.ideographic,
////字体间距，值为 double 类型，应该是用空格隔开时就认为一个单词，英文容易理解，如 Hello World 就是两个单词，中文的词不用空格隔开，所以文本内容为中文时使用较少
//wordSpacing: 10.0,
////行高，值为 double 类型，最终是该属性的值乘以 fontSize 作为行高，所以该值更像是一个行高系数
//height: 2.0),
//),

class MyText extends StatelessWidget {
  String s = "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈11112222222233啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦0000";
  String s1 = "哈哈哈哈native_哈哈哈哈window_ap哈哈哈哈i_disconnect InputMethodManagerActivityRecordFinishing";
  String s111 = "急啊纠结啊";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseMaterialApp(
        body: new SingleChildScrollView(
      child: new Column(
        children: [
          Text(
            "12344",
          ),
          Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "34556",
                style: TextStyle(color: Colors.red, fontSize: 30),
              )),
          Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                s,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
              )),
          Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                s1,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
                overflow: TextOverflow.fade,
              )),
          Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                s,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 36,
                  fontWeight:FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
                maxLines: 2,
              )),
        ],
      ),
    )
    );
  }
}

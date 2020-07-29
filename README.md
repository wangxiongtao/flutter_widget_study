# flutter_dawn_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


模板配置路径在file->settings->editor-> File and Code Templates 里，选择 Files 一栏，点击左上角加号，新建

StatefulWidget 模板配置：

```
import 'package:flutter/material.dart';
/// 创建时间：${DATE} 
/// 作者：${USER}
#set( $items = $NAME.split("_") )
#set( $class = "" )
#set( $item = "" )
#foreach($item in $items)
   #set( $class = $class + $item.substring(0,1).toUpperCase() + $item.substring(1).toLowerCase() )
#end
class ${NAME} extends StatefulWidget {
  ${NAME}({Key key}) : super(key: key);
@override
  _${NAME} createState() => _${NAME}();
}
class _${NAME}  extends State<${NAME}> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
```


StatelessWidget模板配置
```
import 'package:flutter/material.dart';
/// 创建时间：${DATE} 
/// 作者：${USER}
#set( $items = $NAME.split("_") )
#set( $class = "" )
#set( $item = "" )
#foreach($item in $items)
   #set( $class = $class + $item.substring(0,1).toUpperCase() + $item.substring(1).toLowerCase() )
#end
class ${class} extends StatelessWidget {
  ${class}({Key key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container();
  }
}
```


快捷键生成代码模板配置路径在File -> Settings -> Editor -> Live Templates 里，点击左上角加号，新建
快捷键自定义为 stw1 是生成StatelessWidget代码 配置为

```
class  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
```
快捷键自定义为 stw2 是生成StatefulWidget代码 配置为

```
class  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
```




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

StatefulWidget 模板配置：

```import 'package:flutter/material.dart';
#set( $items = $NAME.split("_") )
#set( $class = "" )
#set( $item = "" )
#foreach($item in $items)
   #set( $class = $class + $item.substring(0,1).toUpperCase() + $item.substring(1).toLowerCase() )
#end
class ${class} extends StatefulWidget {
  ${class}({Key key}) : super(key: key);
@override
  _${class}State createState() => _${class}State();
}
class _${class}State extends State<${class}> {
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
}``


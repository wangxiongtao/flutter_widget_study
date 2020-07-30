

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dawn_app/page/MyButton.dart';
import 'package:flutter_dawn_app/page/MyContainer.dart';
import 'package:flutter_dawn_app/page/MyIcon.dart';
import 'package:flutter_dawn_app/page/MyImage.dart';
import 'package:flutter_dawn_app/page/MyListView.dart';
import 'package:flutter_dawn_app/page/MyText.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(new MyList());
}
class MyList extends StatelessWidget{
  final List<String> list=[];
  MyList(){
    list.add("MyContainer");
    list.add("MyText");
    list.add("MyImage");
    list.add("MyICon");
    list.add("MyButton");
    list.add("MyListView");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(title: new Text("DEMO"),backgroundColor:Colors.orangeAccent),
        body: ListView.separated(
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
            }) ,
      ),
    );
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
  }
  Navigator.push(context, new MaterialPageRoute(builder: builder));
}


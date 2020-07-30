import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 创建时间：2020/7/30 
/// 作者：Dawn

class DataBean{
  String title;
  String name;

  DataBean(this.title, this.name);
  p(){
    print("==========1"+this.title);
  }
  p1(){
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
  final List<DataBean>list=[];

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
      print("_controller.offset..底部位置===${_controller.position.maxScrollExtent}");

      Fluttertoast.showToast(msg:"滑动的距离==${_controller.offset}");
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
      body:Column(
        children: [
          RaisedButton(
            child:  Text("固定头部",style: TextStyle(height: 4),),
            onPressed: ()=>{
              setState((){
//                list.insert(0, DataBean("title123", "namekkkk"));
                list.insert(0, null);
            })

            },
          ),

          Divider(color: Colors.orange,height: 10,thickness:10),
          Expanded(child: _getListView(),),

        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }
  Widget _getListView(){
    return ListView.separated(
      separatorBuilder:(context, index){
        return Divider(color: Colors.red,height: 0,thickness:0);
      },
      itemCount: list.length,
      itemBuilder:(context, index)=> _getItemBuilder(list[index]),
      controller: _controller,

    );
  }
  Widget _getItemBuilder(DataBean bean){

    return Text("${bean?.name}-----${bean?.title}",style:TextStyle(height: 5));
  }
  void initList(){
    DataBean d=DataBean("title123", "name");
    d..title="111000111444"..name="rrrr"..p();
    print("==========");
    print(d?.title);

   for(int i=0;i<100;i++){
     list.add(DataBean("title$i", "name$i"));
   }
  }

}
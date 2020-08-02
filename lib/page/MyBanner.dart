import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 创建时间：2020/8/1
/// 作者：Dwan
class MyBanner extends StatefulWidget {
  MyBanner({Key key}) : super(key: key);

  @override
  _MyBannerState createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  final List images = [
//    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3076923855,2253382909&fm=26&gp=0.jpg",
//    "https://dss0.bdstatic.com/6Ox1bjeh1BF3odCf/it/u=3397687402,1616189618&fm=85&app=92&f=JPEG?w=121&h=75&s=A54098463A1029D6B8AF3C3C03001018",
//    "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2314446063,554471474&fm=26&gp=0.jpg",
//    "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1211338343,1056512950&fm=26&gp=0.jpg",
//    "https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3131646502,2497317700&fm=26&gp=0.jpg",
//    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3930510857,1870350260&fm=26&gp=0.jpg",
//    "https://ss3.bdstatic.com/cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3930510857,1870350260&fm=26&gp=0.jpg",
  ];
  bool play = false;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("==banner=build=====>");
    return BaseMaterialApp(
      body: Column(
        children: [
          RaisedButton(
            child: Text("click1===$play"),
            onPressed: () => {
              setState(() {
                images.addAll([
                  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3076923855,2253382909&fm=26&gp=0.jpg",
                  "https://dss0.bdstatic.com/6Ox1bjeh1BF3odCf/it/u=3397687402,1616189618&fm=85&app=92&f=JPEG?w=121&h=75&s=A54098463A1029D6B8AF3C3C03001018",
                  "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2314446063,554471474&fm=26&gp=0.jpg",
                  "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1211338343,1056512950&fm=26&gp=0.jpg",
                  "https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3131646502,2497317700&fm=26&gp=0.jpg",
                  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3930510857,1870350260&fm=26&gp=0.jpg",
                  "https://ss3.bdstatic.com/cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3930510857,1870350260&fm=26&gp=0.jpg",
                ]);
//                play=!play;
//                options=CarouselOptions(
//                    height: 140,
//                    autoPlay: true,
//                    viewportFraction: 1,
//                    onPageChanged: (int index,
//                        CarouselPageChangedReason reason) =>
//                    {ToastUtil.toast("$index=======${reason.index}")});
//                ToastUtil.toast("setState==$play");
              }),
            },
          ),
          RaisedButton(
            child: Text("play===$play"),
            onPressed: () => {
              setState(() {
                play = !play;
//                options=CarouselOptions(
//                    height: 140,
//                    autoPlay: true,
//                    viewportFraction: 1,
//                    onPageChanged: (int index,
//                        CarouselPageChangedReason reason) =>
//                    {ToastUtil.toast("$index=======${reason.index}")});
//                ToastUtil.toast("setState==$play");
              }),
            },
          ),
          _getBanner()
        ],
      ),
    );
  }

  Widget _getBanner() {
    return new SizedBox(
      height: 140,
      child: Swiper(
        key: UniqueKey(),
        duration: 5000,

//      scale:0.8,
//      fade:0.8,
        index: index,
        onIndexChanged: (index) => setState(() => this.index = index),
        onTap: (index) => print("=banner===onTap===>$index"),
        itemBuilder: (c, i) {
          return CachedNetworkImage(
            width: 120,
            fit: BoxFit.fitWidth,
            imageUrl: images[i],
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
        itemCount: images.length,
        pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(size: 8, activeSize: 8),
        ),
        autoplay: play,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

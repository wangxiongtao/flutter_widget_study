import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dawn_app/page/BaseMaterialApp.dart';

/// 创建时间：2020/7/29
/// 作者：Dawn
//BoxFit.none：将图片的内容按原大小居中显示。
//BoxFit.contain：将图片的内容完整居中显示，通过按比例缩小或原来的 size 使得图片宽/高等于或小于组件的宽/高，类似 Android 的 centerInside。
//BoxFit.cover：按比例放大图片的 size 居中显示，类似 Android 的 centerCrop。
//BoxFit.fill：把图片不按比例放大/缩小到组件的大小显示，类似 Android 的 fitXY。
//BoxFit.fitHeight：把图片的高按照组件的高显示，宽等比例放大/缩小。
//BoxFit.fitWidth：把图片的宽按照组件的宽显示，高等比例放大/缩小。
//BoxFit.scaleDown：如果图片宽高大于组件宽高，则让图片内容完全居中显示，此时同 contain，如果图片宽高小于组件宽高，则按图片原大小居中显示，此时同 none。
class MyImage extends StatelessWidget {
  MyImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseMaterialApp(
        body: new SingleChildScrollView(
            child: new Column(
              crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Image.asset("images/icon_logo.png",),
                  Image.asset("images/icon_logo.png",width: 100,),
                  Image.network("https://static.shenzhoubb.com/images/ad/banner/banner_ZCZSHD_02.png",),
                  Image.network("https://static.shenzhoubb.com/images/ad/banner/banner_ZCZSHD_02.png",),
                  CachedNetworkImage(
                    width: 120,
                    fit: BoxFit.fitWidth,
                    imageUrl:"https://static.shenzhoubb.com/images/ad/banner/banner_ZCZSHD_02.png",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  new ClipRRect(
                    child: Image.network("https://static.shenzhoubb.com/images/ad/banner/banner_ZCZSHD_02.png",),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  new ClipOval(
                    child: Image.network(
                      "https://static.shenzhoubb.com/images/ad/banner/banner_ZCZSHD_02.png",
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,

                    ),
                  ),
                  new CircleAvatar(
                    backgroundImage: NetworkImage("https://static.shenzhoubb.com/images/ad/banner/banner_ZCZSHD_02.png"),

                  )

                ]
            )
        )
    );
  }
}

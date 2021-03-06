import 'package:dio/dio.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';

class HttpInterceptor extends InterceptorsWrapper {
  HttpInterceptor(): super(
      onRequest:(RequestOptions options) async {
        // 在请求被发送之前做一些事情
        return options; //continue
        // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse:(Response response) async {
        // 在返回响应数据之前做一些预处理
//        print("=http==DioResponse===>$response");
        int statusCode=response.statusCode;
        if(statusCode!=200){
        return DioError(error:"服务器开小差");
        }
        return response; // continue
      },
      onError: (DioError e) async {
        // 当请求失败时做一些预处理
//        print("=http==DioError===>$e");
        return e;//continue
      }
  );


}
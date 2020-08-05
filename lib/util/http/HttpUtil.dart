import 'package:dio/dio.dart';
import 'package:flutter_dawn_app/util/ToastUtil.dart';
import 'package:flutter_dawn_app/util/http/interceptors/HttpInterceptor.dart';

class HttpUtil{
  static HttpUtil instance;
  static String url="https://api.apiopen.top/todayVideo";
  Dio _dio;

  static HttpUtil _getInstance(){
    if(instance==null){
      instance=HttpUtil._initDio();
    }
    return instance;
  }
  factory HttpUtil(){
    return _getInstance();
  }

  HttpUtil._initDio(){
    _dio=new Dio(_getBaseOption());
    _dio.interceptors.add(HttpInterceptor());
    _dio.interceptors.add(LogInterceptor(responseBody: true,requestBody: true)); //开启请求日志
  }
  Dio get dio=>_dio;
  //  {
//  /// Http method.
//  String method;
//
//  /// 请求基地址,可以包含子路径，如: "https://www.google.com/api/".
//  String baseUrl;
//
//  /// Http请求头.
//  Map<String, dynamic> headers;
//
//  /// 连接服务器超时时间，单位是毫秒.
//  int connectTimeout;
//  /// 2.x中为接收数据的最长时限.
//  int receiveTimeout;
//
//  /// 请求路径，如果 `path` 以 "http(s)"开始, 则 `baseURL` 会被忽略； 否则,
//  /// 将会和baseUrl拼接出完整的的url.
//  String path = "";
//
//  /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
//  /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
//  /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
//  /// 就会自动编码请求体.
//  String contentType;
//
//  /// [responseType] 表示期望以那种格式(方式)接受响应数据。
//  /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
//  ///
//  /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
//  /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
//  ///
//  /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
//  ResponseType responseType;
//
//  /// `validateStatus` 决定http响应状态码是否被dio视为请求成功， 返回`validateStatus`
//  ///  返回`true` , 请求结果就会按成功处理，否则会按失败处理.
//  ValidateStatus validateStatus;
//
//  /// 用户自定义字段，可以在 [Interceptor]、[Transformer] 和 [Response] 中取到.
//  Map<String, dynamic> extra;
//
//  /// Common query parameters
//  Map<String, dynamic /*String|Iterable<String>*/ > queryParameters;
//}
  _getBaseOption(){
    BaseOptions options=new BaseOptions();
    options.baseUrl="";
    options.receiveTimeout=3000;
    options.connectTimeout=3000;
    options.headers={"aaaaa":"222"};
    return options;
  }

  Future<Response> get(String url,[Map<String, String> map]) async {
    // TODO: implement doRequest
    try {
      Response response =await _dio.get(url,queryParameters: map);
//      print("==Request===>response===>$response");
      return response;
    } catch (e) {
      String message="请求失败，请重试";
      if(e is DioError){
        message=e.message;
      }
      ToastUtil.toast(message);
    }
    return null;
  }
  Future<Response> post(String url,[Map<String, String> map]) async {
    // TODO: implement doRequest
    try {
//      FormData formData = FormData.fromMap(map);
      Response response =await _dio.post(url,data: map);
//      print("==Request===>response===>$response");
      return _dio.resolve(response);
    } catch (e) {
      String message="请求失败，请重试";
      if(e is DioError){
        message=e.message;
      }
      ToastUtil.toast(message);
    }
    return null;
  }






}
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;



/// 创建时间：2020/8/5
/// 作者：Dawn
@RestApi(baseUrl: "http://baidu.com")
abstract class RestClient {

  @GET('/tags')
  Future<List<String>> getTags({@DioOptions() options});
}

void test() {
//  final dio = Dio();
//  dio.httpClientAdapter = MockAdapter();
//
//  dio.interceptors.add(InterceptorsWrapper(onRequest: (options) {
//    print(options.extra);
//    print(options.baseUrl);
//    print(options.method);
//    print(options.headers);
//  }));
//  final api = RestClient(dio, baseUrl: MockAdapter.mockBase);
//  final options = buildCacheOptions(Duration(days: 10));
//  api.getTags(options: options).then((it) {
//    print(it.length);
//  });
}
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
      //  baseUrl: 'http://finalproject3.runasp.net/',
        baseUrl: 'http://finalproject5.runasp.net/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang = 'en',
     String? token
   // required String token,
  }) async {

    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}'
    };
    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       options.headers['Authorization'] = 'Bearer $token';
    //       return handler.next(options);
    //     },
    //   ),
    // );

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
    String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
     // 'Content-Type': 'application/json',
      'Content-Type': data is FormData ? 'multipart/form-data' : 'application/json',
      'lang': lang,
     // 'Authorization': token != null ? 'Bearer $token' : null,

       'Authorization': 'Bearer $token'
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': data is FormData ? 'multipart/form-data' : 'application/json',
      //'Content-Type': 'application/json',
      //'Authorization': 'Bearer $token'
      'Authorization': token != null ? 'Bearer $token' : null,
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
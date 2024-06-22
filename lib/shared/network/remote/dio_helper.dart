import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init()
  {
    dio=Dio();
  }
  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? query,
    required Map<String,dynamic>data,
    String? token
})
  async {
    return await dio.post(
        path,
        queryParameters: query,
        data:data
    );
  }
}
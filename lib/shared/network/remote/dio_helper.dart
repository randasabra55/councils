// // import 'dart:developer';
// //
// // import 'package:dio/dio.dart';
// // import 'package:http/http.dart' as http;
// //
// // class DioHelper {
// //   static late Dio dio;
// //
// //   static init() {
// //     dio = Dio();
// //   }
// //
// //   static Future<Response> postData(
// //       {
// //         required String path,
// //       Map<String, dynamic>? query,
// //       required Map<String, dynamic> data,
// //       String? token}) async {
// //     // log('start');
// //     // final url = Uri.parse( 'http://192.168.1.6:57500/api/User/ActivateEmail');
// //     // try {
// //     //   final response = await http.post(
// //     //     url,
// //     //     body: {
// //     //       'email': 'Randa.20377380@compit.aun.edu.eg',
// //     //     },
// //     //   );
// //     //
// //     //   if (response.statusCode == 200) {
// //     //     // Successful request
// //     //     print('Response body: ${response.body}');
// //     //     // You can parse the response.body if it's JSON or XML
// //     //   } else {
// //     //     // Request failed
// //     //     print('Request failed with status: ${response.statusCode}');
// //     //   }
// //     // } catch (e) {
// //     //   // Exception handling
// //     //   print('Error: $e');
// //     // }
// //     var a = await dio.post(
// //       path:path,
// //       // options: Options(
// //       //   sendTimeout: Duration(seconds: 10),
// //       //   headers: {
// //       //     'accept': '*/*',
// //       //     'Content-Type': 'application/json',
// //       //   },
// //       // ),
// //       // 'http://127.0.0.1:157500/api/User/ActivateEmail',
// //       queryParameters: query,
// //       data: {
// //         'email': email,
// //       },
// //     );
// //     log('//////////////////////////////');
// //     log(a.toString());
// //     log('//////////////////////////////');
// //
// //     return a;
// //   }
// // }
//
// import 'package:dio/dio.dart';
//
// class DioHelper {
//   static late Dio dio;
//
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         connectTimeout: Duration(seconds: 5000),
//           baseUrl: 'https://student.valuxapps.com/api/',
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }
//
//   static Future<Response> getData({
//     required String url,
//    // String url="https://dev-accountdbapi.azurewebsites.net/admin/v1/country?pageNumber=1",
//     Map<String, dynamic>? query,
//     String? lang = 'en',
//     String? token,
//   }) async
//   {
//     // dio.options.headers={
//     //   'Content-Type':'application/json',
//     //   'lang':lang,
//     //   'Authorization':token?? ''
//     // };
//     // await Future.delayed(Duration(seconds: 1));
//     return await dio.get(url, queryParameters: query);
//   }
//
//   static Future<Response> postData({
//     required String url,
//     Map<String, dynamic> ? query,
//     required Map<String, dynamic> data,
//     // String? lang='en',
//     String? token,
//   }) async
//   {
//     // dio.options.headers={
//     //   'Content-Type':'application/json',
//     //   'lang':lang,
//     //   'Authorization':token??''
//     // };
//     return await dio.post(
//       url,
//       queryParameters: query,
//       data: data,
//     );
//   }
// }
//

import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init()
  {
    dio =Dio(
      BaseOptions(
        baseUrl: 'http://councilmanagementsystem2.somee.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData(
      {
        required String url,
        Map<String,dynamic>? query,
        String? lang='en',
        String? token,
      }
      ) async
  {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token?? ''
    };
    // await Future.delayed(Duration(seconds: 1));
    return await dio.get(url,queryParameters:query);
  }

  static Future<Response> postData(
      {
        required String url,
        Map<String,dynamic> ? query,
        required Map<String,dynamic> data,
        String? lang='en',
        String? token,
      }
      ) async
  {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??''
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> putData(
      {
        required String url,
        Map<String,dynamic> ? query,
        required Map<String,dynamic> data,
        String? lang='en',
        String? token,
      }
      ) async
  {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??''
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

}

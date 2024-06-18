import 'package:dio/dio.dart';
import 'dart:developer' as developer;
import 'dart:io';

import '../models/user_model/user_model.dart';

class GetData {
  final dio = Dio();
  UserModel? usermodel;
  dynamic e;
  Future getUserData() async {
    try {
      final response = await dio.get('https://randomuser.me/api/');
      Map<String, dynamic> json = response.data;
      Map<String, dynamic> userData = json['results'][0];
      usermodel = UserModel.fromJson(userData);
      developer.log(userData.toString());
    } on DioException catch (e) {
      if (e.error is SocketException) {
        developer.log(
            'Error: Failed to establish connection. Please check your network connection.\n\n\n $e');
      } else {
        developer.log('Error fetching data: ${e.message}');
      }
    } catch (e) {
      developer.log('Unexpected error: $e');
    }
  }

  // ignore: non_constant_identifier_names
  Future<UserModel?>? get Usrmodl async => usermodel;
}

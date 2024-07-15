import 'dart:async';
import 'package:councils/models/add_member_model/add_member_model.dart';
import 'package:councils/models/council_model/council_model.dart';
import 'package:councils/models/hall_model/hall_model.dart';
import 'package:councils/models/print_topics_model/print_topic_model.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;
import 'dart:io';

class DataService {
  final Dio dio;
  final String authToken;
  final String domain = 'http://finalproject5.runasp.net/api/';

  DataService({required this.authToken}) : dio = Dio() {
    dio.options.headers['Authorization'] = 'Bearer $authToken';
  }

  // Fetch halls data
  Future<List<HallModel>> getHalls() async {
    try {
      final response = await dio.get('${domain}Hall/GetAllHalls');

      Map<String, dynamic> json = response.data;
      List<dynamic> values = json['\$values'];
      developer.log(values.toString());
      List<HallModel> halls =
      values.map((data) => HallModel.fromJson(data)).toList();
      developer.log(halls.toString());
      return halls;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        developer.log(
            'Error: Failed to establish connection. Please check your network connection.\n\n\n $e');
      } else {
        developer.log('Error fetching data: ${e.message}');
      }
      return [];
    } catch (e) {
      developer.log('Unexpected error: $e');
      return [];
    }
  }

  // Post council data
  Future<dynamic> createCouncil(CouncilCreationModel council) async {
    try {
      final response = await dio.post(
        '${domain}Councils/CreateCouncil',
        data: council.toJson(),
      );
      final typeCouncilId = response.data['typeCouncilId'];
      developer.log('Council created with type Council Id: $typeCouncilId');
      final ID = response.data['id'];
      developer.log('Council created with type Council Id: $ID');

      final returnModel =
      CreateCouncilReturnModel(id: ID, typeCouncilId: typeCouncilId);
      return returnModel;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        developer.log(
            'Error: Failed to establish connection. Please check your network connection.\n\n\n $e');
      } else {
        developer.log('Error posting data: ${e.message}');
      }
      return null;
    } catch (e) {
      developer.log('Unexpected error: $e');
      return null;
    }
  }

  // Fetch users by name
  Future<List<AddMemberModel>> getUsersByName(String fullname) async {
    try {
      final response =
      await dio.get('${domain}User/GetAllUserByname?fullname=$fullname');

      List<dynamic> values = response.data['\$values'];
      List<AddMemberModel> users =
      values.map((data) => AddMemberModel.fromJson(data)).toList();
      return users;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        developer.log(
            'Error: Failed to establish connection. Please check your network connection.\n\n\n $e');
      } else {
        developer.log('Error fetching data: ${e.message}');
      }
      return [];
    } catch (e) {
      developer.log('Unexpected error: $e');
      return [];
    }
  }

  // Fetch council members by council type ID
  Future<List<AddMemberModel>> getCouncilMembersByType(
      int typeCouncilId) async {
    try {
      final response = await dio.get(
          '${domain}CouncilMember/GetAllUserInCounilType?idtypecouncil=$typeCouncilId');

      List<dynamic> values = response.data['\$values'];
      List<AddMemberModel> members =
      values.map((data) => AddMemberModel.fromJson(data)).toList();
      return members;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        developer.log(
            'Error: Failed to establish connection. Please check your network connection.\n\n\n $e');
      } else {
        developer.log('Error fetching data: ${e.message}');
      }
      return [];
    } catch (e) {
      developer.log('Unexpected error: $e');
      return [];
    }
  }

  Future<List<SearchCouncilModel>> getCouncilsByName(String name) async {
    try {
      final response =
      await dio.get('${domain}Councils/GetAllCouncilByname?name=$name');
      List<dynamic> values = response.data['\$values'];
      List<SearchCouncilModel> councils =
      values.map((data) => SearchCouncilModel.fromJson(data)).toList();
      developer.log(councils.toString());
      return councils;
    } on DioError catch (e) {
      handleError(e);
      return [];
    } catch (e) {
      developer.log('Unexpected error: $e');
      return [];
    }
  }

  Future<SearchCouncilModel?> getCouncilByDate(String date) async {
    try {
      final response =
      await dio.get('${domain}Councils/GetCouncilBydate?date=$date');
      return SearchCouncilModel.fromJson(response.data);
    } on DioException catch (e) {
      handleError(e);
      return null;
    } catch (e) {
      developer.log('Unexpected error: $e');
      return null;
    }
  }

  Future<List<SearchCouncilModel>> getCouncilsByDuration(
      String duration) async {
    try {
      final response =
      await dio.get('${domain}Councils/GetAllCouncilByDate?date=$duration');
      List<dynamic> values = response.data['\$values'];
      List<SearchCouncilModel> councils =
      values.map((data) => SearchCouncilModel.fromJson(data)).toList();
      return councils;
    } on DioException catch (e) {
      handleError(e);
      return [];
    } catch (e) {
      developer.log('Unexpected error: $e');
      return [];
    }
  }

  // Fetch topics by council ID
  Future<List<PrintTopicModel>> getTopicsByCouncilId(int councilId) async {
    try {
      final response = await dio.post(
        '${domain}Topics/GetAllTopicsByIdCouncil',
        data: {'councilId': councilId},
      );
      List<dynamic> values = response.data['\$values'];
      List<PrintTopicModel> topics =
      values.map((data) => PrintTopicModel.fromJson(data)).toList();
      return topics;
    } on DioError catch (e) {
      handleError(e);
      return [];
    } catch (e) {
      developer.log('Unexpected error: $e');
      return [];
    }
  }

  void handleError(DioException e) {
    if (e.error is SocketException) {
      developer.log(
          'Error: Failed to establish connection. Please check your network connection.\n\n\n $e');
    } else {
      developer.log('Error fetching data: ${e.message}');
    }
  }
}

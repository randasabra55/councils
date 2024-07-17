import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:councils/Services/data_service.dart';
import 'package:councils/models/add_member_model/add_member_model.dart';
import 'package:councils/models/council_model/council_model.dart';
import 'package:councils/modules/AddCouncilMember/cubit/CouncilMember_State.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

class CouncilMemberCubit extends Cubit<CouncilMemberState> {
  final DataService dataService;
  final CreateCouncilReturnModel createCouncilReturnModel;

  CouncilMemberCubit(
      {required this.dataService, required this.createCouncilReturnModel})
      : super(CouncilMemberInitial());

  Future<void> searchUsers(String fullname) async {
    emit(CouncilMemberLoading());
    try {
      final response = await dataService.dio
          .get('${dataService.domain}User/GetUserByname?fullname=$fullname');
      List<dynamic> values = response.data['\$values'];
      List<AddMemberModel> users =
          values.map((data) => AddMemberModel.fromJson(data)).toList();
      emit(CouncilMemberLoaded(users: users));
    } on DioException catch (e) {
      if (e.error is SocketException) {
        developer.log(
            'Error: Failed to establish connection. Please check your network connection.\n\n\n $e');
      } else {
        developer.log('Error fetching data: ${e.message}');
      }
      emit(CouncilMemberError());
    } catch (e) {
      developer.log('Unexpected error: $e');
      emit(CouncilMemberError());
    }
  }

  Future<void> fetchCouncilMembers() async {
    emit(CouncilMemberLoading());
    try {
      final response = await dataService.dio.get(
          '${dataService.domain}CouncilMember/GetAllUserInCounilType?idtypecouncil=${createCouncilReturnModel.typeCouncilId}');
      List<dynamic> values = response.data['\$values'];
      List<AddMemberModel> members =
          values.map((data) => AddMemberModel.fromJson(data)).toList();
      emit(CouncilMemberLoaded(users: members));
    } on DioException catch (e) {
      if (e.error is SocketException) {
        developer.log(
            'Error: Failed to establish connection. Please check your network connection.\n\n\n $e');
      } else {
        developer.log('Error fetching data: ${e.message}');
      }
      emit(CouncilMemberError());
    } catch (e) {
      developer.log('Unexpected error: $e');
      emit(CouncilMemberError());
    }
  }
}

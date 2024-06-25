

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:councils/modules/login_after_forget/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/add_new_pass_model/pass_after_forget_model.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';

class AddNewPassCubit extends Cubit<AddNewPasswordStates>{
  AddNewPassCubit(): super(AddNewPassInitialState());

  static AddNewPassCubit get(context)=>BlocProvider.of(context);

 AddNewPassModel? addNewPassModel;

  void AddNewPass({
    required String token,
    required String password,
    required String confirmPass
  })
  {
    emit(AddNewPassLoadingState());
    DioHelper.postData(
      url: ADDNEWPASS,
      // url: 'http://localhost:57500/api/User/ForgetPassword',
      data: {
        'token':token,
        'newPassword':password,
        'confirmNewPassword':confirmPass
      },
    ).then((value) {
      addNewPassModel=AddNewPassModel.fromjson(value.data);
     // forgetModel=UserForgetPasswordModel.fromjson(value.data);
      emit(AddNewPassSuccessState(addNewPassModel!));
      CacheHelper.saveData(key: 'token', value: addNewPassModel?.token);
      // otp=value.data;
      //  loginModel=UserLoginModel.fromjson(value.data);
      //  emit(ForgetPassSuccessState(forgetModel));
    }).catchError((error){
      log(error);
      emit(AddNewPassErrorState(error));
    });
  }

// void userLogin({
//
//   required String email,
//   required String password,
//
// }){
//   emit(UserLoginLoadingState());
//   DioHelper.postData(
//     path: 'http://localhost:57500/api/User/Login',
//     data: {
//
//       'email': email,
//       'password': password,
//
//     },
//   ).then((value) {
//     print(value.data);
//     loginModel=UserLoginModel.fromjson(value.data);
//     //loginModel = UseLoginModel.fromjson(value.data!);
//     print(loginModel!.permission!.addCollage);
//     emit(UserLoginSuccessState(loginModel!));
//   }).catchError((error){
//     print(error.toString());
//     emit(UserLoginErrorState(error.toString()));
//   });
// }

}
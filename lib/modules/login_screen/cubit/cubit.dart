import 'dart:developer';

import 'package:councils/modules/login_screen/cubit/states.dart';
import 'package:councils/shared/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/user_login_model/user_login.dart';
import '../../../shared/network/remote/dio_helper.dart';

class UserLoginCubit extends Cubit<UserLoginStates>{
  UserLoginCubit(): super(UserLoginInitialState());

  static UserLoginCubit get(context)=>BlocProvider.of(context);

  UserLoginModel? loginModel;

  void userLogin({

    required String email,
    required String password,

  }){
    emit(UserLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
    //  url: 'http://localhost:57500/api/User/Login',
      data: {

        'email': email,
        'password': password,

      },
    ).then((value) {
      print(value.data);
      if(value != null)
        {
          loginModel = UserLoginModel.fromjson(value.data);
          emit(UserLoginSuccessState(loginModel!));
        }
      else {
        emit(UserLoginErrorState('No data received'));
      }
     // loginModel = UserLoginModel.fromjson(value.data!);
      //print(loginModel?.data?.name);
    //  emit(UserLoginSuccessState(loginModel!));
    }).catchError((error){
      log(error.toString());
      emit(UserLoginErrorState(error.toString()));
    });
    }
    //   print(value.data);
    //   loginModel=UserLoginModel.fromjson(value.data);
    //
    //   //loginModel = UseLoginModel.fromjson(value.data!);
    //  // print(loginModel!.permission!.addCollage);
    //   emit(UserLoginSuccessState(loginModel!));
    // }).catchError((error){
    //   print(error.toString());
    //   emit(UserLoginErrorState(error.toString()));
    // });
 // }

}
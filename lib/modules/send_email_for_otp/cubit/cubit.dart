import 'package:councils/modules/send_email_for_otp/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user_login_model/user_login.dart';
import '../../../shared/network/remote/dio_helper.dart';

class ForgetPassCubit extends Cubit<ForgetPassStates>{
  ForgetPassCubit(): super(ForgetPassInitialState());

  static ForgetPassCubit get(context)=>BlocProvider.of(context);

  UserLoginModel? loginModel;
  int? otp;

  void forgetPass({
    required String email
})
  {
    emit(ForgetPassLoadingState());
    DioHelper.postData(
        url: 'http://localhost:57500/api/User/ForgetPassword',
        data: {
          'email':email
        },
    ).then((value) {
     // otp=value.data;
      loginModel=UserLoginModel.fromjson(value.data);
      emit(ForgetPassSuccessState(loginModel!));
    }).catchError((error){
      emit(ForgetPassErrorState(error));
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
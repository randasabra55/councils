import 'package:councils/models/user_forget_password/user_forget_pass_model.dart';
import 'package:councils/modules/forget_password_screen/cubit/states.dart';
import 'package:councils/shared/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/remote/dio_helper.dart';

class ForgetPassCubit extends Cubit<ForgetPassStates>{
  ForgetPassCubit(): super(ForgetPassInitialState());

  static ForgetPassCubit get(context)=>BlocProvider.of(context);

  UserForgetPasswordModel? forgetModel;

  void forgetPass({
    required String email
})
  {
    emit(ForgetPassLoadingState());
    DioHelper.postData(
      url: FORGETPASSWORD,
       // url: 'http://localhost:57500/api/User/ForgetPassword',
        data: {
          'email':email
        },
    ).then((value) {
      forgetModel=UserForgetPasswordModel.fromjson(value.data);
      emit(ForgetPassSuccessState(forgetModel!));
     // otp=value.data;
    //  loginModel=UserLoginModel.fromjson(value.data);
    //  emit(ForgetPassSuccessState(forgetModel));
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
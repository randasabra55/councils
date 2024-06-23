import 'package:councils/modules/login_screen/cubit/states.dart';
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
      url: 'http://localhost:57500/api/User/Login',
      data: {

        'email': email,
        'password': password,

      },
    ).then((value) {
      print(value.data);
      loginModel=UserLoginModel.fromjson(value.data);
      //loginModel = UseLoginModel.fromjson(value.data!);
      print(loginModel!.permission!.addCollage);
      emit(UserLoginSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(UserLoginErrorState(error.toString()));
    });
  }

}
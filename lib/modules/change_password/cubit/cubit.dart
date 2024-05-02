

import 'package:bloc/bloc.dart';
import 'package:councils/modules/change_password/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassCubit extends Cubit<ChangePassStates>{

  ChangePassCubit():super(AppInitialState());

  static ChangePassCubit get(context)=>BlocProvider.of(context);
  bool isPass=false;
  void passwordShow(){
    isPass=!isPass;
    emit(AppShowPasswordState());
  }

  // bool isConfirmPass=false;
  // void passwordConfirmShow(){
  //   isConfirmPass=!isConfirmPass;
  //   emit(AppShowConfirmPasswordState());
  // }
//  static AppCubit get(context)=>BlocProvider.of(context);

}
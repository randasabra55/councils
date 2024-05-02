import 'package:bloc/bloc.dart';
import 'package:councils/modules/edit_profile/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);
  bool isPass=false;
  void passwordShow(){
    isPass=!isPass;
    emit(AppShowPasswordState());
  }

  bool isConfirmPass=false;
  void passwordConfirmShow(){
    isConfirmPass=!isConfirmPass;
    emit(AppShowConfirmPasswordState());
  }
//  static AppCubit get(context)=>BlocProvider.of(context);

}
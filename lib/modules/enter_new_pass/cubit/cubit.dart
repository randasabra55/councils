



import 'package:bloc/bloc.dart';
import 'package:councils/modules/enter_new_pass/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmChangePassCubit extends Cubit<ConfirmChangePassStates>{

  ConfirmChangePassCubit():super(InitialState());

  static ConfirmChangePassCubit get(context)=>BlocProvider.of(context);
  bool isPass=false;
  void passwordShow(){
    isPass=!isPass;
    emit(ShowPasswordState());
  }

  bool isConfirmPass=false;
  void passwordConfirmShow(){
    isConfirmPass=!isConfirmPass;
    emit(ShowConfirmPasswordState());
  }
//  static AppCubit get(context)=>BlocProvider.of(context);

}
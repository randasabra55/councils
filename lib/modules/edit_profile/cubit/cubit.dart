import 'package:bloc/bloc.dart';
import 'package:councils/modules/edit_profile/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileStates>{

  EditProfileCubit():super(EditProfileInitialState());

  static EditProfileCubit get(context)=>BlocProvider.of(context);
  bool isPass=false;
  void passwordShow(){
    isPass=!isPass;
    emit(EditProfileShowPasswordState());
  }

  bool isConfirmPass=false;
  void passwordConfirmShow(){
    isConfirmPass=!isConfirmPass;
    emit(EditProfileShowConfirmPasswordState());
  }
//  static AppCubit get(context)=>BlocProvider.of(context);

}
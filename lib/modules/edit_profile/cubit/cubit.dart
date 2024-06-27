import 'dart:developer';

import 'package:councils/models/profile_model/profile_model.dart';
import 'package:councils/modules/edit_profile/cubit/states.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
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

  ProfileModel? profileModel;
  void editProfile({

    required String url,
    required Map<String,dynamic>data
})
  {
    DioHelper.putData(
        url: url,
        data: data,
      //  data: data
    ).then((value) {
      profileModel=ProfileModel.fromjson(value.data);
    //  emit(EditProfileSuccessState());
    //  ProfileModel
    }).catchError((error){
      log(error.toString());
      emit(EditProfileErrorState(error));
    });
  }
//  static AppCubit get(context)=>BlocProvider.of(context);

}
import 'dart:developer';

import 'package:councils/models/profile_model/profile_model.dart';
import 'package:councils/modules/chair_man_profile/cubit/states.dart';
import 'package:councils/shared/network/end_point.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit():super(ProfileInitialState());
  ProfileCubit get(context)=>BlocProvider.of(context);

  ProfileModel? profileModel;
  void userProfile()
  {
     DioHelper.getData(
         url: PROFILE
     ).then((value) {
       profileModel=ProfileModel.fromjson(value.data);
       log("done profile");
       emit(ProfileSuccessState(profileModel!));
     }).catchError((error){
       log(error);
       emit(ProfileErrorState(error));
     });
  }

}
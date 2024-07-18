import 'dart:developer';
import 'package:councils/models/profile_model/profile_model.dart';
import 'package:councils/modules/chair_man_profile/cubit/states.dart';
import 'package:councils/shared/component/constants.dart';
import 'package:councils/shared/network/end_point.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit():super(ProfileInitialState());
  static ProfileCubit get(context)=>BlocProvider.of(context);

  ProfileModel? profileModel;
 // ProfileModel? profile;
  void userProfile()
  {
     DioHelper.getData(
         url: PROFILE,
         token: token,

        // token: token
     ).then((value) {
     //  print(token);

       log(token);
      // log(value.data['token']);
       profileModel=ProfileModel.fromjson(value.data);
       log('=====================${value.data.toString()}');
      // profile=profileModel;
       log("done profile");

      // return await profileModel;
       emit(ProfileSuccessState());
     }).catchError((error){
       log('not done');
       log(error.toString());
       emit(ProfileErrorState(error));
     });
     //return profileModel;
  }

}
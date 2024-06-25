
import 'dart:developer';

import 'package:councils/modules/activation_screen/cubit/states.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivateCubit extends Cubit<ActivateStates>
{
  ActivateCubit():super(ActivateInitialState());

  static ActivateCubit get(context)=>BlocProvider.of(context);

  Future<void> userActivate({
    required String email
})
  async {
    emit(ActivateLoadingState());
    log('ad');
    DioHelper.postData(
        url: 'http://localhost:57500/api/User/ActivateEmail',
        data: {
          'email': email,
  }
    ).then((value) {
      print(value);
      emit(ActivateSuccessState(value.data['password']));
    }).catchError((error){
      print(error.toString());
      emit(ActivateErrorState(error));
    });
  }

}
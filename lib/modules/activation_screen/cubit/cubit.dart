import 'dart:developer';
import 'package:councils/modules/activation_screen/cubit/states.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
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

    DioHelper.postData(
      //http://localhost:57500/api/User/ActivateEmail'
        url: 'http://127.0.0.1:8000/api/User/ActivateEmail',
        data: {
          'email': email,
  }
    ).then((value) {
      //print(value);
      log('gggg');
      emit(ActivateSuccessState(value.data['password']));
    }).catchError((error){
      log(error.toString());
      //print(error.toString());
      emit(ActivateErrorState(error));
    });
  }

}
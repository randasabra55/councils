import 'dart:developer';
import 'package:councils/modules/activation_screen/cubit/states.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/end_point.dart';

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
      //'
        url: Activate,
     // url: "https://dev-accountdbapi.azurewebsites.net/admin/v1/country?pageNumber=1",
        data: {
          'email': email,
  }
    ).then((value) {
      print(value);
      log('gggg');
      log(value.data);
      emit(ActivateSuccessState());
    //  emit(ActivateSuccessState(value.data['password']));
    }).catchError((error){
     // log(error.toString());
      print("errer: "+error.toString());
      emit(ActivateErrorState(error));
    });
  }

}
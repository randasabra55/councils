
import 'dart:developer';

import 'package:councils/models/otp_model.dart';
import 'package:councils/modules/code_verify_screen/cubit/states.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/end_point.dart';



class VerifyCodeCubit extends Cubit<CodeVerificationStates>
{
  VerifyCodeCubit():super(CodeVerInitialState());

  static VerifyCodeCubit get(context)=>BlocProvider.of(context);

  OTPModel? otpModel;
  void OTP({
    required String token,
    required String? otp
})
  {

    DioHelper.postData(
     // url: Activate,
      url: CONFIRMOTP,
      //  url: 'http://localhost:57500/api/User/ConfirmOTP',
        data: {
          'token':token,
          'otp':otp
        }

    ).then((value) {
      log('message');
      otpModel=OTPModel.fromjson(value.data);
      print(otpModel?.result);
      log('ggggggg');
      if(otpModel!.result==true)
        {
          emit(CodeVerSuccessState(otpModel!));
        }

    }).catchError((error){
      emit(CodeVerErrorState(error));
    });
  }
}
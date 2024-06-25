
import 'package:councils/modules/code_verify_screen/cubit/states.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/end_point.dart';



class VerifyCodeCubit extends Cubit<CodeVerificationStates>
{
  VerifyCodeCubit():super(CodeVerInitialState());

  static VerifyCodeCubit get(context)=>BlocProvider.of(context);
  void OTP({
    required String token,
    required int otp
})
  {
    DioHelper.postData(
     // url: Activate,
        url: 'http://localhost:57500/api/User/ConfirmOTP',
        data: {
          'token':token,
          'otp':otp
        }
    );
  }
}
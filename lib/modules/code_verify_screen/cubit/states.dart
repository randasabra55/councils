import 'package:councils/models/user_forget_password/user_forget_pass_model.dart';

abstract class CodeVerificationStates{}

class CodeVerInitialState extends CodeVerificationStates{}

class CodeVerLoadingState extends CodeVerificationStates{}

class CodeVerSuccessState extends CodeVerificationStates{
 // final int code;
  final UserForgetPasswordModel confirmOTP;
  CodeVerSuccessState(this.confirmOTP);
 // CodeVerSuccessState(this.code);

}

class CodeVerErrorState extends CodeVerificationStates{
  final String error;

  CodeVerErrorState(this.error);

}




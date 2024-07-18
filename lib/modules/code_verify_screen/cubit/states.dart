import 'package:councils/models/otp_model.dart';
import 'package:councils/models/user_forget_password/user_forget_pass_model.dart';

abstract class CodeVerificationStates{}

class CodeVerInitialState extends CodeVerificationStates{}

class CodeVerLoadingState extends CodeVerificationStates{}

class CodeVerSuccessState extends CodeVerificationStates{
 // final int code;
  final OTPModel otpModel;
  CodeVerSuccessState(this.otpModel);
 // CodeVerSuccessState(this.code);

}

class CodeVerErrorState extends CodeVerificationStates{
  final String error;

  CodeVerErrorState(this.error);

}




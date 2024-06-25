abstract class CodeVerificationStates{}

class CodeVerInitialState extends CodeVerificationStates{}

class CodeVerLoadingState extends CodeVerificationStates{}

class CodeVerSuccessState extends CodeVerificationStates{
  final int code;

  CodeVerSuccessState(this.code);

}

class CodeVerErrorState extends CodeVerificationStates{
  final String error;

  CodeVerErrorState(this.error);

}




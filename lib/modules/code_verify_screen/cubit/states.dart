abstract class CodeVerificationStates{}

class CodeVerInitialState extends CodeVerificationStates{}

class CodeVerLoadingState extends CodeVerificationStates{}

class CodeVerSuccessState extends CodeVerificationStates{
  final String password;

  CodeVerSuccessState(this.password);

}

class CodeVerErrorState extends CodeVerificationStates{
  final String error;

  CodeVerErrorState(this.error);

}




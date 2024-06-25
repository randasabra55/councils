abstract class ActivateStates{}

class ActivateInitialState extends ActivateStates{}

class ActivateLoadingState extends ActivateStates{}

class ActivateSuccessState extends ActivateStates{
 // final int password;

 // ActivateSuccessState(this.password);

}

class ActivateErrorState extends ActivateStates{
  final String error;

  ActivateErrorState(this.error);

}




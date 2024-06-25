import '../../../models/user_forget_password/user_forget_pass_model.dart';

abstract class ForgetPassStates{}

class ForgetPassInitialState extends ForgetPassStates{}

class ForgetPassLoadingState extends ForgetPassStates{}

class ForgetPassSuccessState extends ForgetPassStates{
  final UserForgetPasswordModel forgetModel;

  ForgetPassSuccessState(this.forgetModel);
}

class ForgetPassErrorState extends ForgetPassStates{
  final String error;
  ForgetPassErrorState(this.error);
}


import '../../../models/user_login_model/user_login.dart';

abstract class ForgetPassStates{}

class ForgetPassInitialState extends ForgetPassStates{}

class ForgetPassLoadingState extends ForgetPassStates{}

class ForgetPassSuccessState extends ForgetPassStates{
  final UserLoginModel loginModel;

  ForgetPassSuccessState(this.loginModel);

}

class ForgetPassErrorState extends ForgetPassStates{
  final String error;
  ForgetPassErrorState(this.error);
}


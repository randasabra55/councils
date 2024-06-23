import '../../../models/user_login_model/user_login.dart';

abstract class UserLoginStates{}

class UserLoginInitialState extends UserLoginStates{}

class UserLoginLoadingState extends UserLoginStates{}

class UserLoginSuccessState extends UserLoginStates{
  final UserLoginModel loginModel;

  UserLoginSuccessState(this.loginModel);

}

class UserLoginErrorState extends UserLoginStates{
  final String error;
  UserLoginErrorState(this.error);
}


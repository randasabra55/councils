import '../../../models/add_new_pass_model/pass_after_forget_model.dart';

abstract class AddNewPasswordStates{}

class AddNewPassInitialState extends AddNewPasswordStates{}

class AddNewPassLoadingState extends AddNewPasswordStates{}

class AddNewPassSuccessState extends AddNewPasswordStates{
  final AddNewPassModel addNewPassModel;

  AddNewPassSuccessState(this.addNewPassModel);

}

class AddNewPassErrorState extends AddNewPasswordStates{
  final String error;
  AddNewPassErrorState(this.error);

}
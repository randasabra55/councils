import 'package:councils/models/profile_model/profile_model.dart';

abstract class EditProfileStates {}

class EditProfileInitialState extends EditProfileStates{}

class EditProfileLoadingState extends EditProfileStates{}

class EditProfileSuccessState extends EditProfileStates{
  final ProfileModel profileModel;

  EditProfileSuccessState(this.profileModel);

}

class EditProfileErrorState extends EditProfileStates{
  final String error;

  EditProfileErrorState(this.error);

}

class EditProfileShowPasswordState extends EditProfileStates{}

class EditProfileShowConfirmPasswordState extends EditProfileStates{}



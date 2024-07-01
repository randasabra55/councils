import 'package:councils/models/get_councils_model.dart';

abstract class GetAllMeetingStates{}

class GetAllMeetingInitialState extends GetAllMeetingStates{}

class GetAllMeetingLoadingState extends GetAllMeetingStates{}

class GetAllMeetingSuccessState extends GetAllMeetingStates {
  final GetCouncilModel getCouncilModel;
//final FlutterModel flutterModel;
  GetAllMeetingSuccessState(this.getCouncilModel);

}

class GetAllMeetingErrorState extends GetAllMeetingStates{
  final String error;

  GetAllMeetingErrorState(this.error);

}

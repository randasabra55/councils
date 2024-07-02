
import '../../../models/notofication_model.dart';

abstract class NotificationStates{}

class NotificationInitialState extends NotificationStates{}

class NotificationAcceptState extends NotificationStates{}

class NotificationRejectState extends NotificationStates{}

class NotificationShowAccept_RejectState extends NotificationStates{}

class GetNotificationSuccessState extends NotificationStates{
  final GetNotificationModel getNotificationModel;

  GetNotificationSuccessState(this.getNotificationModel);
}

class GetNotificationErrorState extends NotificationStates{
  final String error;
  GetNotificationErrorState(this.error);

}


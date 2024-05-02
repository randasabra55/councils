class NotificationModel {
  String text;
  String time;

  // bool isShow;

  NotificationModel({
    required this.text,
    required this.time,
    //  required this.isShow
  });

  bool isAccept = true;

  accept() {
    isAccept = true;
  }

  reject() {
    isAccept = false;
  }

  bool isShow = false;

  showAccept_Reject() {
    isShow = false;
  }

  hideAccept_Reject() {
    isShow = true;
  }

// NotificationCubit s=NotificationCubit.get(context);
}

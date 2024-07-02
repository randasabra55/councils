class GetNotificationModel{
  String? idd;
  List<notificationInfo>values=[];
  GetNotificationModel.fromjson(Map<String,dynamic>json)
  {
    idd=json['\$id'];
    json['values'].forEach((element){
      values.add(notificationInfo.fromjson(element));
    });
  }

}
class notificationInfo{
  String? idd;
  int? notificationId;
  bool? isSeen;
  String? memberId;
  String? councilTitle;
  String? date;
  String? hall;
  notificationInfo.fromjson(Map<String,dynamic>json)
  {
    idd=json['\$id'];
    notificationId=json['notificationId'];
    isSeen=json['isSeen'];
    memberId=json['memberId'];
    councilTitle=json['councilTitle'];
    date=json['date'];
    hall=json['hall'];
  }

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
}

// bool isAccept = true;
//
// accept() {
//   isAccept = true;
// }
//
// reject() {
//   isAccept = false;
// }
//
// bool isShow = false;
//
// showAccept_Reject() {
//   isShow = false;
// }
//
// hideAccept_Reject() {
//   isShow = true;
// }
/*
{
  "$id": "1",
  "$values": [
    {
      "$id": "2",
      "notificationId": 1,
      "isSeen": false,
      "memberId": "ac0ac98a-5cae-452e-bd16-791ae7934220",
      "councilTitle": "finance council",
      "date": "2024-07-10T22:18:27.017",
      "hall": "دكتور بهجت"
    }
  ]
}
 */
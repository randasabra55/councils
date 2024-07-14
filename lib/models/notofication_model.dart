// class GetNotificationModel{
//   String? idd;
//   List<notificationInfo>values=[];
//   GetNotificationModel.fromjson(Map<String,dynamic>json)
//   {
//     idd=json['\$id'];
//     if (json['values'] != null) {
//       json['values'].forEach((element) {
//         values.add(notificationInfo.fromjson(element));
//       });
//     }
//   }
//
// }
// class notificationInfo{
//   String? idd;
//   int? notificationId;
//   bool? isSeen;
//   String? memberId;
//   String? councilTitle;
//   String? date;
//   String? hall;
//   notificationInfo.fromjson(Map<String,dynamic>json)
//   {
//     idd=json['\$id'];
//     notificationId=json['notificationId'];
//     isSeen=json['isSeen'];
//     memberId=json['memberId'];
//     councilTitle=json['councilTitle'];
//     date=json['date'];
//     hall=json['hall'];
//   }
//
//   bool isAccept = true;
//
//   accept() {
//     isAccept = true;
//   }
//
//   reject() {
//     isAccept = false;
//   }
//
//   bool isShow = false;
//
//   showAccept_Reject() {
//     isShow = false;
//   }
//
//   hideAccept_Reject() {
//     isShow = true;
//   }
// }

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

class GetNotificationModel {
  String? id;
  List<NotificationInfo>? values;

  GetNotificationModel({
    required this.id,
    required this.values,
  });

  factory GetNotificationModel.fromjson(Map<String, dynamic> json) {
    return GetNotificationModel(
      id: json['\$id'],
      values: json['\$values'] != null
          ? (json['\$values'] as List).map((item) => NotificationInfo.fromjson(item)).toList()
          : [],
    );
  }
}

class NotificationInfo {
  final int notificationId;
  final bool isSeen;
  final String memberId;
  final String councilTitle;
  final String date;
  final String hall;

  bool isShow = false; // Added property
  bool isAccept = false; // Added property

  NotificationInfo({
    required this.notificationId,
    required this.isSeen,
    required this.memberId,
    required this.councilTitle,
    required this.date,
    required this.hall,
  });

  // Factory constructor to create an instance of NotificationInfo from JSON
  factory NotificationInfo.fromjson(Map<String, dynamic> json) {
    return NotificationInfo(
      notificationId: json['notificationId'],
      isSeen: json['isSeen'],
      memberId: json['memberId'],
      councilTitle: json['councilTitle'],
      date: json['date'],
      hall: json['hall'],
    );
  }

  void showAccept_Reject() {
    isShow = true;
  }

  void hideAccept_Reject() {
    isShow = false;
  }

  void accept() {
    isAccept = true;
  }

  void reject() {
    isAccept = false;
  }
}


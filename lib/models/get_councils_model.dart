class GetCouncilModel{
  String? idd;
  List<meetingInfo> values=[];
  GetCouncilModel({this.idd, required this.values});
 // GetCouncilModel.fromjson
  GetCouncilModel.fromjson(Map<String,dynamic>json)
  {
    idd=json['\$id'];
   // if (json['\$values'] != null) {
      //values = [];
      json['\$values'].forEach((element) {
        values.add(meetingInfo.fromjson(element));
      });
    }
//  }

}

class meetingInfo{
  String? id;
  int? councilId;
  String? title;
  String? date;
  String? hall;
  meetingInfo.fromjson(Map<String,dynamic>json)
  {
    id=json['\$id'];
    councilId=json['id'];
    title=json['title'];
    date=json['date'];
    hall=json['hall'];
  }
}

// class GetCouncilModel {
//   List<MeetingInfo> values;
//
//   GetCouncilModel({required this.values});
//
//   factory GetCouncilModel.fromJson(Map<String, dynamic> json) {
//     return GetCouncilModel(
//       values: List<MeetingInfo>.from(
//         json['\$values'].map((x) => MeetingInfo.fromJson(x)),
//       ),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '\$values': List<dynamic>.from(values.map((x) => x.toJson())),
//     };
//   }
// }
//
// class MeetingInfo {
//   String id;
//   int councilId;
//   String title;
//   String date;
//
//   MeetingInfo({
//     required this.id,
//     required this.councilId,
//     required this.title,
//     required this.date,
//   });
//
//   factory MeetingInfo.fromJson(Map<String, dynamic> json) {
//     return MeetingInfo(
//       id: json['\$id'],
//       councilId: json['id'],
//       title: json['title'],
//       date: json['date'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '\$id': id,
//       'id': councilId,
//       'title': title,
//       'date': date,
//     };
//   }
// }


// class GetCouncilModel {
//   final String $id;
//   final List<meetingInfo> $values;
//
//   GetCouncilModel({
//     required this.$id,
//     required this.$values,
//   });
//
//   factory GetCouncilModel.fromJson(Map<String, dynamic> json) {
//     return GetCouncilModel(
//       $id: json['\$id'],
//       $values: (json['\$values'] as List<dynamic>)
//           .map((item) => meetingInfo.fromJson(item))
//           .toList(),
//     );
//   }
// }
//
// class meetingInfo {
//   final int id;
//   final String title;
//   final String date;
//
//   meetingInfo({
//     required this.id,
//     required this.title,
//     required this.date,
//   });
//
//   factory meetingInfo.fromJson(Map<String, dynamic> json) {
//     return meetingInfo(
//       id: json['id'],
//       title: json['title'],
//       date: json['date'],
//     );
//   }
// }

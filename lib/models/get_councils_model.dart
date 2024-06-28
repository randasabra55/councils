class GetCouncilModel{
 // String? id;
  List<meetingInfo>? values;
  GetCouncilModel.fromjson(Map<String,dynamic>json)
  {
    json['values'].forEach((element)
    {
      values?.add(meetingInfo.fromjson(element));
    });
   // values=(json['values'] != null ? meetingInfo.fromjson(json['values']) : null) as List<meetingInfo>?;
  }
}

class meetingInfo{
 // String id;
  int? councilId;
  String? title;
  String? date;
  meetingInfo.fromjson(Map<String,dynamic>json)
  {
   // id=json['$id'];
    councilId=json['id'];
    title=json['title'];
    date=json['date'];
  }
}
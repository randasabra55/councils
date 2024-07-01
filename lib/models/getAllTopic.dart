class GetAllTopicModel{
  String? idd;
  List<topicInfo> values=[];
  GetAllTopicModel({this.idd, required this.values});

  GetAllTopicModel.fromjson(Map<String,dynamic>json)
  {
    idd=json['\$id'];

    json['\$values'].forEach((element){
      values.add(topicInfo.fromjson(element));
    });
  }
}
class topicInfo{
  String? idd;
  int? id;
  String? title;
  String? type;
  bool? isDisscussed;
  String? notes;
  String? result;
  String? dateTimeCreated;
  int? councilId;
  String? council;
  String? attachment;

  topicInfo.fromjson(Map<String,dynamic>json){
    idd=json['\$id'];
    id=json['id'];
    title=json['title'];
    type=json['type'];
    isDisscussed=json['isDiscussed'];
    notes=json['notes'];
    result=json['result'];
    dateTimeCreated=json['dateTimeCreated'];
    councilId=json['councilId'];
    council=json['council'];
    attachment=json['attachment'];

  }
}

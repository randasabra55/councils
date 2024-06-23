
class UserLoginModel{
  String? token;
  bool? result;
  UserPermission? permission;
  String? error;
 // UserLoginModel({required this.token,required this.permission});
  UserLoginModel.fromjson(Map<String,dynamic>json)
  {
    token=json['token'];
    result=json['result'];
    permission=(json['permission'] != null ? UserPermission.fromjson(json['permission']) : null)!;
    error=json['error'];
  }
}

class UserPermission{
  String? fullName;
  String? email;
  bool? addTopic;
  bool? addResult;
  bool? editTypeCouncil;
  bool? createTypeCouncil;
  bool? editCouncil;
  bool? addCouncil;
  bool? arrange;
  bool? addCollage;
  bool? addDepartment;
  bool? addHall;
  bool? updatepermission;
  bool? updateUse;
  UserPermission.fromjson(Map<String,dynamic>json)
  {
    fullName=json['fullName']!;
    email=json['email']!;
    addTopic=json['addTopic']!;
    addResult=json['addResult']!;
    editTypeCouncil=json['editTypeCouncil']!;
    createTypeCouncil=json['createTypeCouncil']!;
    editCouncil=json['editCouncil']!;
    addCouncil=json['addCouncil']!;
    arrange=json['arrange']!;
    addCollage=json['addCollage']!;
    addDepartment=json['addDepartment']!;
    addHall=json['addHall']!;
    updatepermission=json['updatepermission']!;
    updateUse=json['updateUse']!;
  }
}
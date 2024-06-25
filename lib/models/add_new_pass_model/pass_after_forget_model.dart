
class AddNewPassModel{
  String? id;
  String? token;
  bool? result;
  UserPermission? permission;
  errors? error;
  //String? error;
  // UserLoginModel({required this.token,required this.permission});
  AddNewPassModel.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    token=json['token'];
    result=json['result'];
    permission=(json['permission'] != null ? UserPermission.fromjson(json['permission']) : null)!;
    error=(json['error'] != null ? errors.fromjson(json['error']) : null)!;
   // error=json['error'];
  }
}

class UserPermission{
  String? id;
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
    id=json['id']!;
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

class errors{
  String? id;
  String? values;
  errors.fromjson(Map<String,dynamic> json){
    id=json['id'];
    values=json['values'];
}
}
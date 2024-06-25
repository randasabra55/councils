
class UserLoginModel{
  String? token;
  bool? result;
  UserPermission? permission;
  Null error;
  //String? error;
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


// class UserLoginModel{
//   bool status;
//   String message;
//   UserData? data;
//   UserLoginModel.fromjson(Map<String,dynamic>json)
//       : status=json['status'],
//         message=json['message'],
//         data=json['data'] != null ? UserData.fromjson(json['data']) : null;
// }
// class UserData{
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? image;
//   int? points;
//   int? credit;
//   String? token;
//   UserData(this.id,this.name,this.email,this.phone,this.image,this.points,this.credit,this.token);
//
//   //named constructor
//   UserData.fromjson(Map<String,dynamic>json){
//     id = json['id']!;
//     name=json['name']!;
//     email=json['email']!;
//     phone=json['phone']!;
//     image=json['image']!;
//     points=json['points']!;
//     credit=json['credit']!;
//     token=json['token']!;
//   }
// }

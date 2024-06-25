class ProfileModel{
  String? id;
  UserData? userData;
  ProfileModel.fromjson(Map<String,dynamic>json){
    id=json['id'];
    userData=(json['userData'] != null ? UserData.fromjson(json['userData']) : null)!;
  }
}

class UserData{
  String? id;
  String? FullName;
 // String otp;
 // bool isVerified;
  String? birthday;
  String? functional_characteristic;
  String? academic_degree;
  String? administrative_degree;
 // String discription;
  String? img;
 // int departmentId;
  departmentInfo? department;
  String? userName;
  String? email;
  String? phoneNumber;

  UserData.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    FullName=json['FullName'];
    birthday=json['birthday'];
    functional_characteristic=json['functional_characteristic'];
    academic_degree=json['academic_degree'];
    administrative_degree=json['administrative_degree'];
    img=json['img'];
    id=json['id'];
    department=(json['department'] != null ? departmentInfo.fromjson(json['depart']) : null)!;
    userName=json['userName'];
    email=json['email'];
    phoneNumber=json['phoneNumber'];

  }
}

class departmentInfo{
  String? name;
  int? collage_id;
  departmentInfo.fromjson(Map<String,dynamic>json){
    name=json['name'];
    collage_id=json['collage_id'];
  }
}

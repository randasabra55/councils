class OTPModel{
  String? id;
  String? token;
  bool? result;
  errors? error;
 // UserPermission? permission;


  //String? error;
  // UserLoginModel({required this.token,required this.permission});
  OTPModel.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    token=json['token'];
    result=json['result'];
    error=(json['error'] != null ? errors.fromjson(json['error']) : null);
   // error=json['error'];
  }
}

class errors{
  String? id;
  String? values;
  errors.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    values=json['values'][0];
  }
}
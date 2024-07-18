import 'package:councils/modules/login_screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../network/local/cache_helper.dart';

String token='';
int? councilId;

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=>LoginScreen()),
          (route)=>false
      );
      //navigateAndFinish(context, ShopLoginScreen());
    }
  });
}
//int? topicId;


// class AppConstants{
//   static const String SERVER_API_URL="http://10.0.2.2:8000/";
//   static const String SERVER_UPLOADS="${SERVER_API_URL}uploads/";
//   static const String STORAGE_DEVICE_OPEN_FIRST_TIME='device_first_open';
//   static const String STORAGE_USER_PROFILE_KEY='user_profile_key';
//   static const String STORAGE_USER_TOKEN_KEY='user_token_key';
// }
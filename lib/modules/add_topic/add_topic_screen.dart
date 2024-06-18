import 'package:councils/modules/topics/topics_screen.dart';
import 'package:councils/modules/upload_topic_screen/upload_topic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../chair_man_profile/chair_man_profile.dart';

class AddTopicScreen extends StatelessWidget {
  const AddTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 8.w,
              ),
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:  Icon(Icons.arrow_back,size: 30.sp,)
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Up coming meeting',
                style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 20.w,
                bottom: 22.h
              //  top: 50.h
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meeting information',
                  style: TextStyle(
                    //  color: Colors.blueAccent,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(
                    start: 18.w
                  ),
                  child: Text(
                   // model.time,
                     'Wed,App 28.5:30 PM',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.sp,

                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(
                    start: 18.w
                  ),
                  child: Text(
                   // model.name,
                     'Meeting 1',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(
                    start: 18.w
                  ),
                  child: Text(
                  //  model.about,
                    'About University Students',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 18.w
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                       // model.hall,
                         'Dr:Mohamed Refat Hall',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          MaterialButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>UploadTopic())
              );
            },
            color: const Color(0xff2752e7),
            minWidth: 270.w,
            height:45.h ,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10.r)
            ),
            child: SizedBox(
              width: 250.w,
              height:45.h ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.w,
                  ),
                  Text(
                    'Add Topic',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp
                    ),
                  ),
                  SizedBox(
                    width: 70.w,
                  ),
                  CircleAvatar(
                    radius: 15.r,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.arrow_forward,color: Colors.white,)
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

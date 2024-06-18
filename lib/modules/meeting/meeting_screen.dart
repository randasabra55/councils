import 'package:councils/models/meeting_model/meeting_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../add_topic/add_topic_screen.dart';

class MeetingScreen extends StatelessWidget {
 //  MeetingScreen({super.key,model});
   //MeetingModel? model;
   List<MeetingModel>model=[
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
     MeetingModel(time: 'Wed,App 28.5:30 PM', name: 'Meeting 1', about: 'About University Students', hall:'Dr:Mohamed Refat Hall'),
   ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                'Meetings',
                style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(
                width: 120.w,
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search,size: 35.sp,)
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
                itemBuilder: (context,index)=>meetingItem(model[index],context),
                itemCount: 10
            ),
          )

        ],
      ),
    );
  }
}


Widget meetingItem(MeetingModel model,context){
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context, MaterialPageRoute(builder: (context)=>AddTopicScreen())
      );
    },
    child: Padding(
      padding: EdgeInsetsDirectional.only(
          start: 20.w,
        bottom: 22.h
        //  top: 50.h
      ),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 95.h,
            width: 88.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.time,
               // 'Wed,App 28.5:30 PM',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14.sp
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                model.name,
               // 'Meeting 1',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
              Text(
                model.about,
                //'About University Students',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    model.hall,
                   // 'Dr:Mohamed Refat Hall',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

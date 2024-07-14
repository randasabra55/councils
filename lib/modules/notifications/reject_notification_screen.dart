import 'package:councils/modules/notifications/cubit/cubit.dart';
import 'package:councils/modules/notifications/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/component/component.dart';

class RejectNotificationScreen extends StatelessWidget {
 // RejectNotificationScreen({super.key});
  NotificationCubit? cubit;
  var apologyController=TextEditingController();

  // RejectNotificationScreen({super.key, required this.cubit});
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Apologies',
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(
                    start: 20.w,
                    end: 20.w
                ),
                child: Text(
                  'Apologies for not attending',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(
                  height: 15.h
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(
                    start: 20.w,
                    end: 20.w
                ),
                child: TextField(
                  controller: apologyController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                  height: 100.h
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(
                  start: 50.w,
                  //end: 20.w
                ),
                child: defaultBottom(
                    radius: 20,
                    text: 'Submit',
                    onpressed: (){
                      cubit?.acceptNotification(isAttending: false,reason: apologyController.text);

                      // NotificationCubit.get(context).acceptNotification(
                      //     isAttending: false,
                      //     reason: apologyController.text
                      // );
                      //  TopicDecisionCubit.get(context).topicDecision(result: resultController.text);
                    },
                    color:const Color(0xff2752e7)
                ),
              )
            ],
          ),
        );
  }
}

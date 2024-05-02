import 'package:councils/modules/notifications/cubit/cubit.dart';
import 'package:councils/modules/notifications/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/notification_model/notification_item_model.dart';

class NotificationItemScreen extends StatefulWidget {
  const NotificationItemScreen({super.key, required this.model});
  final NotificationModel model;
  @override
  State<NotificationItemScreen> createState() => _NotificationItemScreenState();
}

class _NotificationItemScreenState extends State<NotificationItemScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit,NotificationStates>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) {
      //  NotificationCubit cubit=NotificationCubit.get(context);
       // bool isShow=cubit.isShowAccept;
        return Column(
          children: [
            GestureDetector(
              onTap: ()
              {
                if(widget.model.isShow)
                  {
                    setState(() {
                      widget.model.showAccept_Reject();
                    });
                  }
                else
                  {
                    setState(() {
                      widget.model.hideAccept_Reject();
                    });
                  }
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 25.w,end: 20.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24.r,
                      backgroundColor: const Color(0xff5669ff),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Flexible(
                      child: Text(
                        widget.model.text,
                        // 'You have been invited to \n attend a Meeting 1 ',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    const Spacer(),
                   //  SizedBox(
                   //    width: 150.w,
                   //  ),
                    Text(
                      widget.model.time,
                      //'just now',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            if(widget.model.isShow)
              Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: 90.w,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            widget.model.reject();
                          });
                          // cubit.reject();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(6.r)),
                        // color: Colors.grey[100]
                        color: widget.model.isAccept ? Colors.grey[100] :const Color(0xff5669ff),
                        child: Text(
                          'Reject',
                          style: TextStyle(
                              fontSize: 14.sp,
                              //  color: Colors.grey[600]
                              color: widget.model.isAccept
                                  ? Colors.grey[600]
                                  : Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    SizedBox(
                      height: 35.h,
                      width: 90.w,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            widget.model.accept();
                          });
                          // cubit.accept();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(6.r)),
                        //  color: Colors.blue
                        color: widget.model.isAccept ? const Color(0xff5669ff) : Colors.grey[100],
                        child: Text(
                          'Accept',
                          style: TextStyle(
                              fontSize: 14.sp,
                              //  color: Colors.white
                              color: widget.model.isAccept
                                  ? Colors.white
                                  : Colors.grey[600]),
                        ),
                        //  color: Colors.grey[100],
                      ),
                    )
                  ],
                              ),
                ],
              ),
            SizedBox(
              height: 15.h,
            ),
          ],
        );
      },

    );
  }
}
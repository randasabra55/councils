import 'dart:developer';
import 'package:councils/models/get_councils_model.dart';
import 'package:councils/modules/meeting/cubit/cubit.dart';
import 'package:councils/modules/meeting/cubit/states.dart';
import 'package:councils/modules/meeting/no_meeting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../add_topic/add_topic_screen.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetAllMeetingCubit()..getCouncils(),
      child: BlocConsumer<GetAllMeetingCubit, GetAllMeetingStates>(
        listener: (BuildContext context, GetAllMeetingStates state) {
          if (state is GetAllMeetingErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.error}')),
            );
          }
        },
        builder: (BuildContext context, GetAllMeetingStates state) {
          final cubit = GetAllMeetingCubit.get(context);
          final councilModel = cubit.getCouncilModel;

          if (state is GetAllMeetingLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllMeetingErrorState) {
            return const Center(child: Text('Error loading meetings.'));
          } else if (councilModel == null || councilModel.values.isEmpty) {
            return NoMeetingView(); // Display NoMeetingView if no meetings are available
          } else {
            return Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      SizedBox(width: 8.w),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, size: 30.sp),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Meetings',
                        style: TextStyle(
                            fontSize: 28.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final meetingInfo = councilModel.values[index];
                        return meetingItem(meetingInfo, context);
                      },
                      itemCount: councilModel.values.length,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

Widget meetingItem(MeetingInfo? model, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (model != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddTopicScreen(model: model),
          ),
        );
        log('Pressed Council ID: ${model.councilId}');
      }
    },
    child: Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 22.h, end: 6.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 93.h,
            width: 88.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model?.date ?? '',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14.sp),
                ),
                SizedBox(height: 5.h),
                Text(
                  model?.title ?? '',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          model?.hall ?? '',
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

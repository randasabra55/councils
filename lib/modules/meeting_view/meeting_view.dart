
import 'package:councils/modules/meeting_view/schedule_meeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/components/app_bar_custom.dart';
import '../../models/custom_icon_model/custom_icon.dart';

class MeetingView extends StatefulWidget {
  const MeetingView({super.key});

  @override
  State<MeetingView> createState() => _MeetingViewState();
}

class _MeetingViewState extends State<MeetingView> {
  String pageName = 'Meeting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const ScheduleMeeting();
            },
          ));
        },
        child: Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient:
                  const LinearGradient(begin: Alignment.centerLeft, stops: [
                0.05,
                0.95
              ], colors: [
                Color(0xff764BE1),
                Color(0xff2F4DFD),
              ])),
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      appBar: appBarCustom(pageName: pageName, fontSize: 25),
      body: const NoUpcomingMeeting(),
      // bottomNavigationBar: const CustomNavigationBar(
      //   selectedIndex: 1,
      // ),
    );
  }
}

class NoUpcomingMeeting extends StatelessWidget {
  const NoUpcomingMeeting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          SvgPicture.string(
            CustomIcon().noUpcomingMeet,
            height: 230.h,
            width: 230.w,
          ),
          35.verticalSpace,
          Text(
            'No Upcoming Meetings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.sp,
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../modules/meeting/no_meeting_view.dart';

class UpcomingMeetingTitle extends StatelessWidget {
  const UpcomingMeetingTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Text(
            'Upcoming Meetings',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 17.sp,
            ),
          ),
          SizedBox(
            width: 45.w,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                elevation: MaterialStatePropertyAll(0)),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoMeetingView(),
                  ),
                  (route) => false);
            },
            child: Row(
              children: [
                Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.blueGrey[400],
                    fontSize: 13.sp,
                  ),
                ),
                3.horizontalSpace,
                Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.blueGrey[400],
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpcomingMeetingComponent extends StatefulWidget {
  const UpcomingMeetingComponent({
    super.key,
    required this.date,
    required this.location,
    required this.name,
  });

  final String date;
  final String name;
  final String location;

  @override
  State<UpcomingMeetingComponent> createState() => _UpcomingMeetingComponentState();
}

class _UpcomingMeetingComponentState extends State<UpcomingMeetingComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: SvgPicture.asset(
                'assets/icons/Date.svg',
                height: 70.h,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(color: Colors.grey, fontSize: 20),
                ),
                Text(
                  widget.location,
                  style: const TextStyle(color: Colors.grey, fontSize: 20),
                ),
                Text(
                  widget.date,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/components/app_bar_custom.dart';
import '../../models/custom_icon_model/custom_icon.dart';


class ScheduleMeeting extends StatefulWidget {
  const ScheduleMeeting({super.key});

  @override
  State<ScheduleMeeting> createState() => _ScheduleMeetingState();
}

class _ScheduleMeetingState extends State<ScheduleMeeting> {
  String pageName = 'Schedule Meeting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7FB),
      appBar: appBarCustom(pageName: pageName, fontSize: 22),
      body: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: ListView(
          children: [
            // TODO: Type
            2.verticalSpace,
            Text(
              'Type of meeting',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
            ),
            20.verticalSpace,
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Type of meeting',
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 85 / 100),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            15.verticalSpace,
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Title of meeting',
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 85 / 100),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.string(
                    CustomIcon().titleOfMeeting,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ),
            30.verticalSpace,
            // TODO: TIME & DATE
            Text(
              'Time & Date',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
            ),
            20.verticalSpace,
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Type of meeting',
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 85 / 100),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            15.verticalSpace,
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Title of meeting',
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 85 / 100),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.string(
                    CustomIcon().titleOfMeeting,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ),
            30.verticalSpace,
            // TODO: LOCATION
            Text(
              'Location',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
            ),
            20.verticalSpace,
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Title of meeting',
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 85 / 100),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.string(
                    CustomIcon().titleOfMeeting,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ),
            30.verticalSpace,
            // TODO: ADD MEMBERS
            Text(
              'Add Members',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
            ),
            20.verticalSpace,
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Title of meeting',
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 85 / 100),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.string(
                    CustomIcon().titleOfMeeting,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ),
            30.verticalSpace,
            Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                    side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.grey.shade300),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.w),
                    ),
                    textStyle: MaterialStatePropertyAll(
                      TextStyle(color: Colors.black, fontSize: 20.sp),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'CANCEL',
                  ),
                ),
                20.horizontalSpace,
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 55.w, vertical: 20.w),
                    ),
                    textStyle: MaterialStatePropertyAll(
                      TextStyle(color: Colors.black, fontSize: 20.sp),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Color(0xff5669FF),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'CREATE',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

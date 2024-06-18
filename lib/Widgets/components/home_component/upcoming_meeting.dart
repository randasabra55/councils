import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/council_model/council_model.dart';

class UpcomingMeeting extends StatefulWidget {
  const UpcomingMeeting({
    super.key,
  });

  @override
  State<UpcomingMeeting> createState() => _UpcomingMeetingState();
}

class _UpcomingMeetingState extends State<UpcomingMeeting> {
  final List<CouncilModel> listCouncil = [
    const CouncilModel(
      councilName: ' الجامعة',
      councilDate: '27 oct 2001',
    ),
    // CouncilModel(
    //   councilName: 'اجتماع مجلس الجامعة',
    //   councilDate: 'DateTime.now()',
    // ),
    // CouncilModel(
    //   councilName: 'اجتماع مجلس الجامعة',
    //   councilDate: 'DateTime.now()',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    ListView view;
    if (listCouncil.length >= 2) {
      view = ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) => UpcomingMeetingComponent(
          date: listCouncil[index].councilDate,
          name: listCouncil[index].councilName,
        ),
      );
    }
    else{
      view = ListView.builder(
        shrinkWrap: true,
        itemCount: listCouncil.length,
        itemBuilder: (context, index) => UpcomingMeetingComponent(
          date: listCouncil[index].councilDate,
          name: listCouncil[index].councilName,
        ),
      );
    }

    return view;
  }
}

class UpcomingMeetingComponent extends StatelessWidget {
  const UpcomingMeetingComponent({
    super.key,
    required this.date,
    required this.name,
  });
  final dynamic date;
  final dynamic name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: const LinearBorder()),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: SvgPicture.asset(
                'assets/icons/Date.svg',
                height: 55.h,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  name,
                  style: const TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

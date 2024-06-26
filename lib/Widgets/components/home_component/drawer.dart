
import 'package:councils/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/custom_icon_model/custom_icon.dart';
import '../../../modules/chair_man_profile/chair_man_profile.dart';
import '../../../modules/home/home_view.dart';
import '../../../modules/meeting_view/meeting_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required String usrName,
    required usrImg,
  })  : _usrName = usrName,
        _usrImg = usrImg;
  final String _usrName;
  // ignore: prefer_typing_uninitialized_variables
  final _usrImg;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300.w,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff4A43EC),
            ),
            child: Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                CircleAvatar(
                  radius: 33.r,
                  backgroundImage: AssetImage(_usrImg),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  _usrName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                const Spacer(
                  flex: 10,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.highlight_remove_sharp,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            alignment: Alignment.topLeft,
            width: 200.w,
            height: 50.h,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  SvgPicture.string(
                    CustomIcon().data[0]['ico'],
                    height: 35.h,
                    width: 35.w,
                  ),
                  10.horizontalSpace,
                  Text(CustomIcon().data[0]['txt']),
                  const Spacer(
                    flex: 1,
                  ),
                  SvgPicture.string(
                    CustomIcon().exIcon,
                    height: 30.h,
                    width: 30.w,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            alignment: Alignment.topLeft,
            width: 200.w,
            height: 50.h,
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ChairManProfile(),
                  ),
                  ),
              child: Row(
                children: [
                  SvgPicture.string(
                    CustomIcon().data[1]['ico'],
                    height: 35.h,
                    width: 35.w,
                  ),
                  10.horizontalSpace,
                  Text(CustomIcon().data[1]['txt']),
                  const Spacer(
                    flex: 1,
                  ),
                  SvgPicture.string(
                    CustomIcon().exIcon,
                    height: 30.h,
                    width: 30.w,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            alignment: Alignment.topLeft,
            width: 200.w,
            height: 50.h,
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MeetingView(),
                  ),
                  ),
              child: Row(
                children: [
                  SvgPicture.string(
                    CustomIcon().data[2]['ico'],
                    height: 35.h,
                    width: 35.w,
                  ),
                  10.horizontalSpace,
                  Text(CustomIcon().data[2]['txt']),
                  const Spacer(
                    flex: 1,
                  ),
                  SvgPicture.string(
                    CustomIcon().exIcon,
                    height: 30.h,
                    width: 30.w,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            alignment: Alignment.topLeft,
            width: 200.w,
            height: 50.h,
            child: InkWell(
              onTap: () => const NavigatorPopHandler(child: HomeView()),
              child: Row(
                children: [
                  SvgPicture.string(
                    CustomIcon().data[3]['ico'],
                    height: 35.h,
                    width: 35.w,
                  ),
                  10.horizontalSpace,
                  Text(CustomIcon().data[3]['txt']),
                  const Spacer(
                    flex: 1,
                  ),
                  SvgPicture.string(
                    CustomIcon().exIcon,
                    height: 30.h,
                    width: 30.w,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            alignment: Alignment.topLeft,
            width: 200.w,
            height: 50.h,
            child: InkWell(
              onTap: () => const NavigatorPopHandler(child: HomeView()),
              child: Row(
                children: [
                  SvgPicture.string(
                    CustomIcon().data[4]['ico'],
                    height: 35.h,
                    width: 35.w,
                  ),
                  10.horizontalSpace,
                  Text(CustomIcon().drItem[4]['txt']),
                  const Spacer(
                    flex: 1,
                  ),
                  SvgPicture.string(
                    CustomIcon().exIcon,
                    height: 30.h,
                    width: 30.w,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            alignment: Alignment.topLeft,
            width: 200.w,
            height: 50.h,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const SettingScreen(),
                ),
              ),
             // onTap: () => const NavigatorPopHandler(child: HomeView()),
              child: Row(
                children: [
                  SvgPicture.string(
                    CustomIcon().data[5]['ico'],
                    height: 35.h,
                    width: 35.w,
                  ),
                  10.horizontalSpace,
                  Text(CustomIcon().data[5]['txt']),
                  const Spacer(
                    flex: 1,
                  ),
                  SvgPicture.string(
                    CustomIcon().exIcon,
                    height: 30.h,
                    width: 30.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

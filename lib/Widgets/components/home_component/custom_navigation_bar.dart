
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/custom_icon_model/custom_icon.dart';
import '../../../modules/home/home_view.dart';
import '../../../modules/meeting_view/meeting_view.dart';
import '../../../modules/profile_view.dart';
import '../../../modules/search/search_view_no_data.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  const CustomNavigationBar({super.key, required this.selectedIndex});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final List<StatefulWidget> screen = const [
    HomeView(),
    MeetingView(),
    SearchView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      indicatorColor: Colors.transparent,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      elevation: 0,
      height: 80.h,
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: (value) {
        setState(
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => screen[value],
              ),
            );
          },
        );
      },
      destinations: [
        NavigationDestination(
          icon: SvgPicture.string(
            CustomIcon().nv[0]['ico'],
            height: 40.h,
            width: 40.w,
          ),
          selectedIcon: SvgPicture.string(
            CustomIcon().nv[0]['icoSelect'],
            height: 40.h,
            width: 40.w,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: SvgPicture.string(
            CustomIcon().nv[1]['ico'],
            height: 40.h,
            width: 40.w,
          ),
          selectedIcon: SvgPicture.string(
            CustomIcon().nv[1]['icoSelect'],
            height: 40.h,
            width: 40.w,
          ),
          label: 'Meeting',
        ),
        NavigationDestination(
          icon: SvgPicture.string(
            CustomIcon().nv[2]['ico'],
            height: 40.h,
            width: 40.w,
          ),
          selectedIcon: SvgPicture.string(
            CustomIcon().nv[2]['icoSelect'],
            height: 40.h,
            width: 40.w,
          ),
          label: 'Search',
        ),
        NavigationDestination(
          icon: SvgPicture.string(
            CustomIcon().nv[3]['ico'],
            height: 40.h,
            width: 40.w,
          ),
          selectedIcon: SvgPicture.string(
            CustomIcon().nv[3]['icoSelect'],
            height: 40.h,
            width: 40.w,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}

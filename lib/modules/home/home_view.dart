// ignore_for_file: file_names

import 'package:councils/Widgets/components/home_component/drawer.dart';
import 'package:councils/models/custom_icon_model/custom_icon.dart';
import 'package:flutter/material.dart';
// import 'dart:developer' as developer;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../notifications/notification_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _usrName = 'Mohamed Sabra';
  final String _usrImg = 'assets/images/Avatar.jpg';

  @override
  void initState() {
    // asyncData();
    super.initState();
  }

  // Future<void> asyncData() async {
  //   usrModel = await GetData().Usrmodl;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        elevation: 0,
        leadingWidth: 75.w,
        toolbarHeight: 80.h,
        backgroundColor: const Color(0xff4A43EC),
        leading: Container(
          padding: EdgeInsets.only(left: 15.w),
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            radius: 33.r,
            backgroundImage: AssetImage(_usrImg),
          ),
        ),
        title: Text(
          _usrName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //  builder: (context)=>
                  builder: (context) =>  const NotificationScreen(),
                ),
              );
            },
            child: SvgPicture.string(
              CustomIcon().notification,
              fit: BoxFit.fill,
              height: 36.h,
              width: 30.w,
            ),
          ),
          14.horizontalSpace,
          Builder(
            builder: (context) => InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                child: SvgPicture.string(CustomIcon().sideMunu),
              ),
            ),
          ),
          14.horizontalSpace,
        ],
        bottom: PreferredSize(
          preferredSize: Size(360.w, 60.h),
          child: Container(
            alignment: Alignment.center,
            height: 70.w,
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                35.horizontalSpace,
                SizedBox(
                  height: 50.h,
                  width: 200.w,
                )
              ],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(
        usrName: _usrName,
        usrImg: _usrImg,
      ),
      body: const ViewCouncils(),
    );
  }
}

class ViewCouncils extends StatelessWidget {
  const ViewCouncils({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: 360.w,
      padding: EdgeInsets.fromLTRB(31.w, 18.h, 15.w, 10.h),
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ElevatedButton(
          //   onPressed: () {
          //     showVoteDialog(context, 'Vote on Proposal XYZ');
          //   },
          //   child: Text('Vote'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     showVoteResultsDialog(context, 'Vote on Proposal XYZ');
          //   },
          //   child: Text('View Results'),
          // ),
        ],
      ),
    );
  }
}

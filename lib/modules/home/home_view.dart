// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';


import '../../Services/data_service.dart';
import '../../Widgets/components/home_component/drawer.dart';
import '../../Widgets/components/home_component/upcoming_meeting.dart';
import '../../Widgets/components/home_component/upcoming_meeting_title.dart';
import '../../models/user_model/user_model.dart';
import '../notifications/notification_screen.dart';
// import '../Models/custom_icon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _usrName = 'Mohamed Sabra';
  final String _usrImg = 'assets/images/Avatar.jpg';
  final _notification =
      '''<svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg"> 
        <circle opacity="0.1" cx="18" cy="18" r="17.5" fill="white" stroke="white"/> <path d="M23 14.6667C23 11.9053 20.7614 9.66675 18 9.66675C15.2386 9.66675 13 11.9053 13 14.6667C13 20.5001 10.5 22.1667 10.5 22.1667H25.5C25.5 22.1667 23 20.5001 23 14.6667" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M19.4417 25.5C19.1435 26.014 18.5942 26.3304 18 26.3304C17.4058 26.3304 16.8565 26.014 16.5583 25.5" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/> </svg>''';
  //final String _notificationActive =
  //  '<svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg"> <circle opacity="0.1" cx="18" cy="18" r="17.5" fill="white" stroke="white"/> <path d="M23 14.6667C23 11.9053 20.7614 9.66675 18 9.66675C15.2386 9.66675 13 11.9053 13 14.6667C13 20.5001 10.5 22.1667 10.5 22.1667H25.5C25.5 22.1667 23 20.5001 23 14.6667" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M19.4417 25.5C19.1435 26.014 18.5942 26.3304 18 26.3304C17.4058 26.3304 16.8565 26.014 16.5583 25.5" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/> <circle cx="23.5" cy="11.5" r="3.5" fill="#FE0202" stroke="#524CE0" stroke-width="2"/> </svg>');
  UserModel? usrModel;
  @override
  void initState() {
    asyncData();
    super.initState();
  }

  Future<void> asyncData() async {
    usrModel = await GetData().Usrmodl;
  }

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
                  builder: (context) =>  const NotificationScreen(),
                ),
              );
            },
            child: SvgPicture.string(
              _notification,
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
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){},
              ),
              // child: SvgPicture.asset(
              //   fit: BoxFit.fill,
              //   height: 18.h,
              //   width: 14.w,
              //
              //   'assets/icons/side_menu.svg',
              // ),
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
                  child: TextField(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 170, 166, 252)),
                    cursorColor: const Color(0xff7974E7),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: SvgPicture.asset(
                        fit: BoxFit.fill,
                        height: 27.h,
                        width: 27.w,
                        'assets/icons/search.svg',
                      ),
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        fontSize: 18.sp,
                        color: const Color(0xff7974E7),
                      ),
                    ),
                  ),
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
      // bottomNavigationBar: const CustomNavigationBar(
      //   selectedIndex: 0,
      // ),
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
          UpcomingMeetingTitle(),
          UpcomingMeeting(),
        ],
      ),
    );
  }
}

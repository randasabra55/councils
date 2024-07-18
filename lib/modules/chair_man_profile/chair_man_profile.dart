// import 'dart:developer';
//
// import 'package:councils/models/profile_model/profile_model.dart';
// import 'package:councils/modules/chair_man_profile/cubit/cubit.dart';
// import 'package:councils/modules/chair_man_profile/cubit/states.dart';
// import 'package:councils/modules/edit_profile/edit_profile_screen.dart';
// import 'package:councils/modules/settings/settings_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
//
// class ChairManProfile extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return BlocProvider(
//       create: (BuildContext context) =>ProfileCubit(),
//
//       child: BlocConsumer<ProfileCubit,ProfileStates>(
//         listener: (BuildContext context, ProfileStates state) {  },
//
//         builder: (BuildContext context, ProfileStates state) {
//         //  late ProfileModel profileModel;
//         //   ProfileCubit.get(context).userProfile();
//         //   if(ProfileCubit.get(context).profileModel!=null) {
//         //     profileModel=ProfileCubit.get(context).profileModel!;
//         //   }
//
//           return Scaffold(
//             // backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               // leading: IconButton(
//               //   icon: Card(
//               //     elevation: 2,
//               //     child: CircleAvatar(
//               //       backgroundColor: Colors.white,
//               //         radius: 14.r,
//               //         child: const Icon(Icons.arrow_back,
//               //           color: Colors.blue,
//               //         )
//               //     ),
//               //   ),
//               //   onPressed: (){
//               //     Navigator.pop(context);
//               //   },
//               // ),
//               title: const Text(
//                 'Profile',
//               ),
//               centerTitle: true,
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 //  crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Center(
//                     child: Stack(
//                       alignment: AlignmentDirectional.bottomEnd,
//                       children: [
//                         CircleAvatar(
//                           // backgroundColor: Colors.white,
//                           radius: 55.r,
//                          backgroundImage: NetworkImage(ProfileCubit.get(context).profileModel?.userData?.img??''),
//                          // backgroundImage: NetworkImage(profileModel?.userData?.img??''),
//                         //  backgroundImage: const NetworkImage('https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1710455070~exp=1710458670~hmac=b93e3f5338c24953a021bf8db8ce3c18cf68345fbf21fe810d5962b04b3d7595&w=996'),
//                         ),
//                         Card(
//
//                           elevation: 2,
//                           child: CircleAvatar(
//                             backgroundColor: Colors.white,
//                             radius: 15.r,
//                             child: IconButton(
//                                 onPressed: (){},
//                                 icon: Icon(
//                                   Icons.camera_alt_outlined,
//                                   color: Colors.blue,
//                                   size: 19.sp,
//                                 )
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14.h,
//                   ),
//                   Padding(
//
//                     padding: const EdgeInsetsDirectional.only(
//                         start: 25,
//                         end: 25
//                     ),
//                     child: Card(
//                       elevation: 2,
//                       child: Container(
//                         height: 180.h,
//                         width: MediaQuery.sizeOf(context).width,
//                         decoration: BoxDecoration(
//                             color: const Color(0xffffffff),
//                             borderRadius: BorderRadiusDirectional.circular(5.r)
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 15.h,
//                             ),
//                             Text(
//                               '    Personal Info',
//                               style: TextStyle(
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             SizedBox(
//                               height: 25.h,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(
//                                   start: 30,
//                                   end: 30
//                               ),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'Your name',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   const Spacer(),
//                                   Text(
//                                   //  ProfileCubit.get(context).profileModel?.userData?.FullName??'',
//                                   //  profileModel?.userData?.FullName??'',
//                                     ProfileCubit.get(context).profileModel?.userData?.FullName??"",
//                                     //'Ahmed Ali',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ],
//
//                               ),
//                             ),
//                             SizedBox(
//                               height: 22.h,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(
//                                   start: 30,
//                                   end: 30
//                               ),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'Degree',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Text(
//                                    // profileModel?.userData?.academic_degree??'',
//                                    // cubit.profileModel?.userData?.academic_degree??'',
//                                     'Bachelors',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ],
//
//                               ),
//                             ),
//                             SizedBox(
//                               height: 22.h,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(
//                                   start: 30,
//                                   end: 30
//                               ),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'Address',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   const Spacer(),
//                                   Text(
//                                     'Assuit',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ],
//
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14.h,
//                   ),
//                   Padding(
//
//                     padding: const EdgeInsetsDirectional.only(
//                         start: 25,
//                         end: 25
//                     ),
//                     child: Card(
//                       elevation: 2,
//                       child: Container(
//                         height: 140.h,
//                         width: MediaQuery.sizeOf(context).width,
//                         decoration: BoxDecoration(
//                             color: Color(0xffffffff),
//                             borderRadius: BorderRadiusDirectional.circular(5.r)
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 15.h,
//                             ),
//                             Text(
//                               '    Contact Info',
//                               style: TextStyle(
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             SizedBox(
//                               height: 25.h,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(
//                                   start: 30,
//                                   end: 30
//                               ),
//                               child: Row(
//                                 children: [
//                                   Text(
//
//                                     'Phone number',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   const Spacer(),
//                                   Text(
//                                  //   profileModel?.userData?.phoneNumber??'',
//                                    // cubit.profileModel?.userData?.phoneNumber??'',
//                                     '01102673638',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ],
//
//                               ),
//                             ),
//                             SizedBox(
//                               height: 22.h,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(
//                                   start: 30,
//                                   end: 30
//                               ),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'Email',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Text(
//                                  //   profileModel?.userData?.email??'',
//                                  //   cubit.profileModel?.userData?.email??'',
//                                     'ahmed@gmail.com',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ],
//
//                               ),
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14.h,
//                   ),
//                   GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context)=>SettingScreen())
//                       );
//                       //print('randa');
//                     },
//                     child: Padding(
//                       padding: const EdgeInsetsDirectional.only(
//                           start: 25,
//                           end: 25
//                       ),
//                       child: Card(
//                         elevation: 2,
//                         child: Container(
//                           height: 50.h,
//                           width: MediaQuery.sizeOf(context).width,
//                           decoration: BoxDecoration(
//                               color: const Color(0xffffffff),
//                               borderRadius: BorderRadiusDirectional.circular(5.r)
//                           ),
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 width: 25.w,
//                               ),
//                               Icon(Icons.settings_outlined,color: Colors.grey[600],),
//                               SizedBox(
//                                 width: 10.w,
//                               ),
//                               Text(
//                                 'Settings',
//                                 style: TextStyle(
//                                     fontSize: 18.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.grey[600]
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 18.h,
//                   ),
//                   GestureDetector(
//                     onTap: (){
//                       log('ranoda');
//                     },
//                     child: Padding(
//                       padding: const EdgeInsetsDirectional.only(
//                           start: 25,
//                           end: 25
//                       ),
//                       child: Card(
//                         elevation: 2,
//                         child: Container(
//                           height: 50.h,
//                           width: MediaQuery.sizeOf(context).width,
//                           decoration: BoxDecoration(
//                               color: const Color(0xffffffff),
//                               borderRadius: BorderRadiusDirectional.circular(5.r)
//                           ),
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 width: 25.w,
//                               ),
//                               Icon(Icons.logout,color: Colors.grey[600],),
//                               SizedBox(
//                                 width: 10.w,
//                               ),
//                               Text(
//                                 'Log out',
//                                 style: TextStyle(
//                                     fontSize: 18.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.grey[600]
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   MaterialButton(
//                     onPressed: (){
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context)=>EditProfileScreen())
//                       );
//                     },
//                     color: const Color(0xff2752e7),
//                     minWidth: 250.w,
//                     height:38.h ,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadiusDirectional.circular(10.r)
//                     ),
//                     child: Text(
//                       'Edit',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.sp
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 35.h,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:councils/models/profile_model/profile_model.dart';
import 'package:councils/modules/chair_man_profile/cubit/cubit.dart';
import 'package:councils/modules/chair_man_profile/cubit/states.dart';
import 'package:councils/modules/edit_profile/edit_profile_screen.dart';
import 'package:councils/modules/login_screen/login.dart';
import 'package:councils/modules/settings/settings_screen.dart';
import 'package:councils/shared/component/component.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChairManProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      ProfileCubit()
        ..userProfile(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (BuildContext context, ProfileStates state) {},
        builder: (BuildContext context, ProfileStates state) {
          ProfileCubit cubit = ProfileCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Profile'),
              centerTitle: true,
            ),
            body: state is! ProfileSuccessState
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 55.r,
                          // backgroundImage: NetworkImage(
                          //     cubit.profileModel?.userData?.img ?? ''),
                        ),
                        Card(
                          elevation: 2,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15.r,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.blue,
                                size: 19.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25, end: 25),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: 180.h,
                        width: MediaQuery
                            .sizeOf(context)
                            .width,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadiusDirectional.circular(5.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              '    Personal Info',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 30, end: 30),
                              child: Row(
                                children: [
                                  Text(
                                    'Your name',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    cubit.profileModel?.userData?.FullName ??
                                        '',
                                  //  maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 16.sp,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 30, end: 30),
                              child: Row(
                                children: [
                                  Text(
                                    'Degree',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    cubit.profileModel?.userData
                                        ?.academic_degree ?? '',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 30, end: 30),
                              child: Row(
                                children: [
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Assuit',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25, end: 25),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: 160.h,
                        width: MediaQuery
                            .sizeOf(context)
                            .width,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadiusDirectional.circular(5.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              '    Contact Info',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 30, end: 30),
                              child: Row(
                                children: [
                                  Text(
                                    'Phone number',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    cubit.profileModel?.userData?.phoneNumber ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 30, end: 30),
                              child: Row(
                                children: [
                                  Text(
                                    'Email  ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                 SizedBox(
                                   width: 60.w,
                                 ),
                                 // const Spacer(),
                                  Flexible(
                                    child: Text(
                                      cubit.profileModel?.userData?.email ?? '',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                         // overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => SettingScreen()),
                  //     );
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.only(
                  //         start: 25, end: 25),
                  //     child: Card(
                  //       elevation: 2,
                  //       child: Container(
                  //         height: 50.h,
                  //         width: MediaQuery
                  //             .sizeOf(context)
                  //             .width,
                  //         decoration: BoxDecoration(
                  //           color: const Color(0xffffffff),
                  //           borderRadius: BorderRadiusDirectional.circular(5.r),
                  //         ),
                  //         child: Row(
                  //           children: [
                  //             SizedBox(
                  //               width: 25.w,
                  //             ),
                  //             Icon(Icons.settings_outlined,
                  //                 color: Colors.grey[600]),
                  //             SizedBox(
                  //               width: 10.w,
                  //             ),
                  //             Text(
                  //               'Settings',
                  //               style: TextStyle(
                  //                 fontSize: 18.sp,
                  //                 fontWeight: FontWeight.w500,
                  //                 color: Colors.grey[600],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 18.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      log('ranoda');
                      CacheHelper.removeData(key: 'token');
                      showToast(text: 'please log in again', state: ToastStates.SUCCESS);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 25, end: 25),
                      child: Card(
                        elevation: 2,
                        child: Container(
                          height: 50.h,
                          width: MediaQuery
                              .sizeOf(context)
                              .width,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadiusDirectional.circular(5.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.w,
                              ),
                              Icon(Icons.logout, color: Colors.grey[600]),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Log out',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  // MaterialButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => EditProfileScreen()),
                  //     );
                  //   },
                  //   color: const Color(0xff2752e7),
                  //   minWidth: 250.w,
                  //   height: 38.h,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadiusDirectional.circular(10.r),
                  //   ),
                  //   child: Text(
                  //     'Edit',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 16.sp,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 35.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

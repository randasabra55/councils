import 'package:councils/modules/change_password/change_password_screen.dart';
import 'package:councils/modules/edit_profile/edit_profile_screen.dart';
import 'package:councils/modules/settings/cubit/cubit.dart';
import 'package:councils/modules/settings/cubit/states.dart';
import 'package:councils/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SettingCubit(),
      child: BlocConsumer<SettingCubit,SettingStates>(
        listener: (BuildContext context, SettingStates state) {  },
        builder: (BuildContext context, SettingStates state) {
          SettingCubit cubit=SettingCubit.get(context);
          bool isSwitch=cubit.isSwich;
          bool isClicked=cubit.isOptionShown;
          bool isLanguage=cubit.isLanguageShown;
          bool isArabic=cubit.isArabic;

          bool isLight=cubit.isThemeLight;
        //  bool isDark=cubit.isThemeDark;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Card(
                  elevation: 2,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 14.r,
                      child: const Icon(Icons.arrow_back,
                        color: Colors.blue,
                      )
                  ),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                'Settings',
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 35.w,
                      ),
                      CircleAvatar(
                        // backgroundColor: Colors.white,
                        radius: 35.r,
                        backgroundImage: const NetworkImage('https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1710455070~exp=1710458670~hmac=b93e3f5338c24953a021bf8db8ce3c18cf68345fbf21fe810d5962b04b3d7595&w=996'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahmed Ali',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            'ahmed@gmail.com',
                            style: TextStyle(
                              //  fontWeight: FontWeight.bold,
                                fontSize: 12.sp
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20
                    ),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: 100,
                        width: MediaQuery.sizeOf(context).width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>EditProfileScreen())
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 15,
                                    end: 25
                                ),
                                child: Row(
                                  children: [
              
                                    CircleAvatar(
                                      backgroundColor: const Color(0xff62c1e7),
                                      radius: 11.r,
                                      child: Icon(
                                        Icons.edit,
                                        size: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        // fontWeight: FontWeight.w500,
                                        // color: Colors.grey[600]
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>ChangePasswordScreen())
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 15,
                                    end: 25
                                ),
                                child: Row(
                                  children: [
              
                                    CircleAvatar(
                                      backgroundColor: const Color(0xff62c1e7),
                                      radius: 11.r,
                                      child: Icon(
                                        Icons.verified_user,
                                        size: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Change Password',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        // fontWeight: FontWeight.w500,
                                        //  color: Colors.grey[600]
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(

                        start: 20,
                        end: 20
                    ),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: 110,
                        width: MediaQuery.sizeOf(context).width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 15,
                                  end: 25
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xff62c1e7),
                                    radius: 12.r,
                                    child: Icon(
                                      Icons.notifications,
                                      size: 15.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Notification',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: const Color(0xff62c1e7)
                                      // fontWeight: FontWeight.w500,
                                      // color: Colors.grey[600]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            GestureDetector(
                              onTap: (){
                                print('randa');
                              },
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 15,
                                    end: 25
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    
                                    Text(
                                      'ON',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        //  color: Colors.grey[600]
                                      ),
                                    ),
                                    const Spacer(),
                                    Switch(
                                      value: isSwitch,
                                     //  activeColor: Colors.blue,
                                       activeTrackColor: const Color(0xff62c1e7),
                                     
                                      onChanged: (value)
                                      {
                                        cubit.changeButtonSwich(value);
                                      },
              
                                    ),
                                   
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding:  const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20
                    ),
                    child: Card(
                      elevation: 2,
                      child: Container(
                       // height: 200.h,
                        width: MediaQuery.sizeOf(context).width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            // Padding(
                            //   padding:  const EdgeInsetsDirectional.only(
                            //       start: 15,
                            //       end: 25
                            //   ),
                            //   child: Row(
                            //     children: [
                            //       CircleAvatar(
                            //         backgroundColor: const Color(0xff62c1e7),
                            //         radius: 11.r,
                            //         child: Icon(
                            //           Icons.light_mode_rounded,
                            //         //  Icons.verified_user_outlined
                            //          // Icons.shield_moon,
                            //           size: 14.sp,
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: 10.w,
                            //       ),
                            //       Text(
                            //         'Theme',
                            //         style: TextStyle(
                            //           fontSize: 14.sp,
                            //           // fontWeight: FontWeight.w500,
                            //           // color: Colors.grey[600]
                            //         ),
                            //       ),
                            //       const Spacer(),
                            //       IconButton(
                            //           onPressed: (){
                            //             cubit.showOption();
                            //           },
                            //           icon:isClicked? Icon(
                            //             Icons.arrow_circle_up,
                            //             size: 18.sp,
                            //           ): Icon(
                            //             Icons.arrow_circle_down,
                            //             size: 18.sp,
                            //           )
                            //       ),
                            //
                            //
                            //     ],
                            //   ),
                            // ),
                            // if(isClicked) Column(
                            //   children: [
                            //     Padding(
                            //       padding:  EdgeInsetsDirectional.only(
                            //         start: 33.w,
                            //         end: 40.w
                            //       ),
                            //       child: const Divider(
                            //         thickness: 1,
                            //         color: Colors.black,
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding:  EdgeInsetsDirectional.only(
                            //         start: 40.w,
                            //
                            //       ),
                            //       child: Row(
                            //         children: [
                            //           Checkbox(
                            //             value: isLight,
                            //             activeColor:Colors.blue,
                            //
                            //             onChanged: (newValue) {
                            //               cubit.whiteMode();
                            //               // Handle checkbox state change
                            //             },
                            //           ),
                            //            Text(
                            //               'White mode',
                            //             style: TextStyle(
                            //               fontSize: 14.sp,
                            //               fontWeight: FontWeight.w500
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //
                            //     Padding(
                            //       padding: EdgeInsetsDirectional.only(
                            //         start: 40.w
                            //       ),
                            //       child: Row(
                            //         children: [
                            //           Checkbox(
                            //             value: !isLight,
                            //             activeColor: Colors.blue,//Colors.grey[400],// Set your initial value here
                            //             onChanged: (newValue) {
                            //               cubit.DarkMode();
                            //               // Handle checkbox state change
                            //             },
                            //           ),
                            //            Text(
                            //                'Dark mode',
                            //              style: TextStyle(
                            //                fontSize: 14.sp,
                            //                fontWeight: FontWeight.w500
                            //              ),
                            //            ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                              // :SizedBox(),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.only(
                            //       start: 15,
                            //       end: 25
                            //   ),
                            //   child: Row(
                            //     children: [
                            //
                            //       // CircleAvatar(
                            //       //   backgroundColor: const Color(0xff62c1e7),
                            //       //   radius: 11.r,
                            //       //   child: Icon(
                            //       //     Icons.language,
                            //       //     size: 14.sp,
                            //       //     color: Colors.white,
                            //       //   ),
                            //       // ),
                            //       // SizedBox(
                            //       //   width: 10.w,
                            //       // ),
                            //       // Text(
                            //       //   'Language',
                            //       //   style: TextStyle(
                            //       //     fontSize: 14.sp,
                            //       //     // fontWeight: FontWeight.w500,
                            //       //     //  color: Colors.grey[600]
                            //       //   ),
                            //       // ),
                            //       // const Spacer(),
                            //       // IconButton(
                            //       //     onPressed: (){
                            //       //       cubit.languageOption();
                            //       //     },
                            //       //     icon:isLanguage? Icon(
                            //       //       Icons.arrow_circle_up,
                            //       //       size: 18.sp,
                            //       //     ): Icon(
                            //       //       Icons.arrow_circle_down,
                            //       //       size: 18.sp,
                            //       //     )
                            //       // ),
                            //      // IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 15.sp,)),
                            //
                            //     ],
                            //   ),
                            // ),
                            // if(isLanguage) Column(
                            //   children: [
                            //     Padding(
                            //       padding:  EdgeInsetsDirectional.only(
                            //           start: 33.w,
                            //           end: 40.w
                            //       ),
                            //       child: const Divider(
                            //         thickness: 1,
                            //         color: Colors.black,
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding:  EdgeInsetsDirectional.only(
                            //         start: 40.w,
                            //
                            //       ),
                            //       child: Row(
                            //         children: [
                            //           Checkbox(
                            //             value: !isArabic,
                            //             activeColor:Colors.blue,
                            //
                            //             onChanged: (newValue) {
                            //               cubit.englishMode();
                            //               // Handle checkbox state change
                            //             },
                            //           ),
                            //           Text(
                            //             'English',
                            //             style: TextStyle(
                            //                 fontSize: 14.sp,
                            //                 fontWeight: FontWeight.w500
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //
                            //     Padding(
                            //       padding: EdgeInsetsDirectional.only(
                            //           start: 40.w
                            //       ),
                            //       child: Row(
                            //         children: [
                            //           Checkbox(
                            //             value: isArabic,
                            //             activeColor: Colors.blue,//Colors.grey[400],// Set your initial value here
                            //             onChanged: (newValue) {
                            //               cubit.arabicMode();
                            //               // Handle checkbox state change
                            //             },
                            //           ),
                            //           Text(
                            //             'Arabic',
                            //             style: TextStyle(
                            //                 fontSize: 14.sp,
                            //                 fontWeight: FontWeight.w500
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 12.h,
                            // ),
                            GestureDetector(
                              onTap: (){
                                signOut(context);
                               // print('randa');
                              },
                              child: Padding(
                                padding:  EdgeInsetsDirectional.only(
                                    start: 15.w,
                                    end: 25.w,
                                  top: 5.h
                                ),
                                child: Row(
                                  children: [
              
                                    CircleAvatar(
                                      backgroundColor: const Color(0xfff23535),
                                      radius: 11.r,
                                      child: Icon(
                                        Icons.logout,
                                        size: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Log Out',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        // fontWeight: FontWeight.w500,
                                        //  color: Colors.grey[600]
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
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



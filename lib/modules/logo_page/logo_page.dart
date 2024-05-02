import 'package:councils/modules/on_boardong_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xff2752e7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: CircleAvatar(
              radius: 115.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: const Color(0xff2752e7),
                radius: 107.r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Councils',
                      style: GoogleFonts.lilyScriptOne(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 55.sp
                        )
                      )
                    ),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(
                        start: 55.w,
                        end: 55.w
                      ),
                      child: const Divider(
                        thickness: 6,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 110.h,
          ),
          MaterialButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context)=>const OnBoardingScreen()),
                    (route)=>false
                );
              },
            height: 43.h,
            minWidth: 300.w,
            shape:   RoundedRectangleBorder(
            //  side:new  BorderSide(color: Color(0xFF2A8068)), //the outline color
               borderRadius: BorderRadius.all(Radius.circular(10.r))
            ),
            color: Colors.white,
            child: Text(
              'Get started',
              style: TextStyle(
                fontSize: 13.sp
              ),
            ),

          ).animate().fade(duration: 2.seconds),
        ],
      ),
    );
  }
}

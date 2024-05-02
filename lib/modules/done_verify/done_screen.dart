import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../layouts/home_layout/home_layout_screen.dart';
import '../../shared/component/component.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(
                image: AssetImage('assets/images/done.png')
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'You\'re verified!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          defaultBottom(
              radius:30,
              color: const Color(0xff2752e7),
              text:'Log in',
              onpressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>HomeLayoutScreen())
                  );
              }
          )
        ],
      ),
    );
  }
}

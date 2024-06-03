import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 8.w,
              ),
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:  Icon(Icons.arrow_back,size: 30.sp,)
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Up coming meeting',
                style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}

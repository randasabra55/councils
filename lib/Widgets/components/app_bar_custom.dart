import 'package:councils/layouts/home_layout/home_layout_screen.dart';
import 'package:councils/models/custom_icon_model/custom_icon.dart';
import 'package:councils/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

AppBar appBarCustom(
    {required String pageName,
    required int fontSize,
    required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leadingWidth: 100.w,
    leading: IconButton(
      style: const ButtonStyle(),
      iconSize: 30,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeLayoutScreen(),
          ),
        );
      },
      icon: Container(
        width: 40,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 6),
            ]),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SvgPicture.string(CustomIcon().back),
      ),
    ),
    title: Text(pageName),
    centerTitle: true,
    titleTextStyle: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black),
  );
}

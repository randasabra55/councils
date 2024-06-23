import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextfield({
  required TextEditingController controller,
  var  validate,
  String? hintText,
  IconData? prefix,
  required TextInputType type,
})
{
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 35,
      end: 35
    ),
    child: TextFormField(
      controller: controller,
      validator: validate,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefix,color: Color(0xff519dd5),),
        // errorBorder: InputBorder(
        //   borderSide: BorderSide(color: Colors.black)
        // )
      ),
      keyboardType: type,

    ),
  );
}

///////////////////////////////////////

Widget defaultBottom({
  required double radius,
   Color color=Colors.green,
 // Color color=Color(0xff2752e7),
  required String text,
  required var onpressed,
}){
  return Container(
    height: 44.h,
    width: 270.w,

    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius)
    ),
    child: MaterialButton(
      onPressed:onpressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white
        ),
      ),
    ),
  );

}
////////////////////////////////////
void showToast({
  required String text,
  required ToastStates state,
})
{
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: ChooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates{SUCCESS,ERROR,WARNING}

Color ChooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color=Colors.green;
      break;
    case ToastStates.ERROR:
      color= Colors.red;
      break;
    case ToastStates.WARNING:
      color= Colors.amber;
      break;
  }
  return color;
}
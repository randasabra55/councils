

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../change_password/cubit/states.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class NewPasswordScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var passController=TextEditingController();
    var configPassController=TextEditingController();
    return BlocProvider(

      create: (BuildContext context) => ConfirmChangePassCubit(),
      child: BlocConsumer<ConfirmChangePassCubit,ConfirmChangePassStates>(

        listener: (context,  state) {  },
        builder: ( context,  state) {
          ConfirmChangePassCubit cubit=ConfirmChangePassCubit.get(context);
          bool isPass=cubit.isPass;
          bool isConfirmPass=cubit.isConfirmPass;


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
                'Change Password',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Text(
                    'Enter New Password',
                    style: TextStyle(
                        fontSize: 17.sp
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 18.w,
                      end: 18.w
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        height: 45.h,
                        child: TextFormField(
                          controller: passController,
                          cursorColor: Colors.black,
                          obscureText: isPass,
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(

                              suffixIcon: IconButton(
                                onPressed: (){
                                  cubit.passwordShow();
                                },
                                icon:isPass?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black,),

                                  borderRadius: BorderRadius.all(Radius.circular(16.r),)
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue,),

                                  borderRadius: BorderRadius.all(Radius.circular(12.r),)
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 18.w,
                      end: 18.w
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        height: 45.h,
                        child: TextFormField(
                          controller: configPassController,
                          cursorColor: Colors.black,
                          obscureText: isConfirmPass,
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(

                              suffixIcon: IconButton(
                                onPressed: (){
                                  cubit.passwordConfirmShow();
                                },
                                icon:isConfirmPass?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black,),

                                  borderRadius: BorderRadius.all(Radius.circular(16.r),)
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue,),

                                  borderRadius: BorderRadius.all(Radius.circular(12.r),)
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 50.w
                  ),
                  child: MaterialButton(

                    onPressed: (){

                    },
                    color: const Color(0xff2752e7),
                    minWidth: 270.w,
                    height:38.h ,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(10.r)
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },


      ),
    );
  }
}

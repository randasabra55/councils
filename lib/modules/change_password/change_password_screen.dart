import 'package:councils/modules/change_password/cubit/cubit.dart';
import 'package:councils/modules/change_password/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enter_new_pass/confirm_change_pass_screen.dart';

class ChangePasswordScreen extends StatelessWidget {


  var passController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>ChangePassCubit(),
      child: BlocConsumer<ChangePassCubit,ChangePassStates>(

        listener: (BuildContext context, ChangePassStates state) {  },
        builder: (BuildContext context, ChangePassStates state) {
          ChangePassCubit cubit=ChangePassCubit.get(context);
          bool isPass=cubit.isPass;
          return Form(
            key: formKey,
            child: Scaffold(
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
                      'Enter old password',
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

                          child: TextFormField(

                           
                           // maxLength: 5,
                            controller: passController,
                            cursorColor: Colors.black,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                                {
                                  return "";
                                }
                              return null;
                            },
                            obscureText: isPass,
                            // keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal:10),
                                errorBorder:OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffbe4d25),
                                    
                                  ),
                                  borderRadius: BorderRadius.circular(14.r)
                                ) ,
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
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 50.w
                    ),
                    child: MaterialButton(

                      onPressed: (){
                        if(formKey.currentState!.validate())
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>NewPasswordScreen())
                            );
                          }

                      },
                      color: const Color(0xff2752e7),
                      minWidth: 270.w,
                      height:38.h ,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10.r)
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp
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

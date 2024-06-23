import 'dart:developer';

import 'package:councils/modules/activation_screen/cubit/cubit.dart';
import 'package:councils/modules/activation_screen/cubit/states.dart';
import 'package:councils/modules/login_screen/login.dart';
import 'package:councils/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivateScreen extends StatefulWidget {


  ActivateScreen({super.key});

  @override
  State<ActivateScreen> createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> {
  var emailController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  bool isEmpty=false;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>ActivateCubit(),
      child: BlocConsumer<ActivateCubit,ActivateStates>(
        listener: (BuildContext context, state) {
          if(state is ActivateSuccessState)
          {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Activation successful!',style: TextStyle(color: Colors.black))),
            );
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginScreen())
            );
          }
          else if(state is ActivateErrorState)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text(state.error,style: TextStyle(color: Colors.black),)),
              );
            }
        },
        builder: (BuildContext context, state) {
          return Scaffold(

            body: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: SingleChildScrollView(
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Row(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 155.w,
                        ),
                        Text(
                          'Activate',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        IconButton(
                            onPressed: (){
                              if(formKey.currentState!.validate()) {
                                if (!isEmpty) {
                                  // isEmpty=false;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen())
                                  );
                                }
                              }

                            },
                            icon: const Icon(Icons.arrow_forward_ios_outlined)
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 2.h,width: 50.w,color: const Color(0xff2752e7),),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(height: 2.h,width: 50.w,color: Colors.grey,)
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Center(
                      child: Text(
                        'Hello Welcome',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Center(
                      child: Text(
                        'To activate your account, please enter\n                       your email',
                        style: TextStyle(
                            color: Colors.grey
                          //  fontWeight: FontWeight.bold,
                          //  fontSize: 24.sp,

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    defaultTextfield(
                      controller: emailController,

                      validate: (value){

                        if(value.isEmpty)
                        {
                          // const Row(
                          //   children: [
                          //     Icon(Icons.ice_skating),
                          //      Text(
                          //        'this email must not be empty',
                          //         style: TextStyle(
                          //           color: Colors.orange
                          //         ),
                          //      );
                          //     ]
                          //    );
                          setState(() {
                            isEmpty=true;
                          });

                          //return 'this email is not valid';
                        }
                        else
                        {
                          setState(() {
                            isEmpty=false;
                          });
                        }
                      },
                      hintText: 'Email',
                      type: TextInputType.emailAddress,
                      prefix: Icons.email,
                    ),
                    (isEmpty)?
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 35.w,
                          top: 10.h
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius:11.r,
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Icons.close,
                              size: 18.sp,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            'this email is not valid',
                            style: TextStyle(
                                color: Colors.blue
                            ),
                          )
                        ],
                      ),
                    ) :const SizedBox(),
                    SizedBox(
                      height: 100.h,
                    ),
                    defaultBottom(
                      color: const Color(0xff2752e7),
                      // color: Color(0xff2752e7),
                      radius: 35,
                      // color: const Color(0xff2752e7),
                      text: 'Next',
                      onpressed: ()
                      {

                        // if(isEmpty)
                        if(formKey.currentState!.validate()) {

                          ActivateCubit.get(context).userActivate(
                              email: emailController.text
                          );

                       //   if (!isEmpty) {
                            formKey.currentState!.save();
                            // isEmpty=false;

                        //  }
                        }
                        else
                        {
                          setState(() {
                            // isEmpty=true;
                            autoValidateMode = AutovalidateMode.always;
                            // AutovalidateMode.always;
                          });
                        }

                        // }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}

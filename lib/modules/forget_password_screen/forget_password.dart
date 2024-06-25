import 'dart:developer';

import 'package:councils/modules/code_verify_screen/code_verify.dart';
import 'package:councils/modules/forget_password_screen/cubit/cubit.dart';
import 'package:councils/modules/forget_password_screen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/component/component.dart';
import '../../shared/component/constants.dart';
import '../../shared/network/local/cache_helper.dart';

class ForgetPasswordScreen extends StatelessWidget {
 var emaillController=TextEditingController();
 var formKey=GlobalKey<FormState>();

  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ForgetPassCubit(),
      child: BlocConsumer<ForgetPassCubit,ForgetPassStates>(

        listener: (BuildContext context, ForgetPassStates state) {
          if(state is ForgetPassSuccessState)
             {
            if (state.forgetModel.result!)
            {
              //print(state.loginModel.message);
              log('${state.forgetModel.token}');
              CacheHelper.saveData(key: 'token', value: state.forgetModel.token).then((value) {
                token= state.forgetModel.token!;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context)=>CodeVerifyScreen()),
                        (route) => false
                );
                // navigateAndFinish(context, HomeLayoutScreen());
              });
            }
            else
            {
              // print(state.loginModel.message);
              showToast(text: 'email or password not correct', state: ToastStates.ERROR);
            }
          }
        },
        builder: (BuildContext context, ForgetPassStates state) {
          return Scaffold(
            // appBar: AppBar(
            //   title: const Text(
            //     'Reset Password',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold
            //     ),
            //
            //   ),
            //   centerTitle: true,
            //   actions: [
            //     IconButton(
            //         onPressed: (){
            //           // Navigator.push(
            //           //     context,
            //           //     MaterialPageRoute(builder: (context)=>CodeVerifyScreen())
            //           // );
            //         },
            //         icon: const Icon(Icons.arrow_forward_ios_outlined)
            //     ),
            //   ],
            // ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        width: 70.w,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                        onPressed: (){
                          if(formKey.currentState!.validate()&&formKey.currentState != null)
                          {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context)=>CodeVerifyScreen()),
                                    (route) => false
                            );
                          }
                          //Navigator.pop(context);
                        },
                        // onPressed: (){
                        //   if(formKey.currentState!.validate())
                        // //  if (formKey.currentState != null && formKey.currentState!.validate())
                        //   {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(builder: (context)=>CodeVerifyScreen())
                        //     );
                        //   }
                        //   //Navigator.pop(context);
                        // },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 2.h,width: 40.w,color: const Color(0xff2752e7),),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(height: 2.h,width: 40.w,color: Colors.grey,),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(height: 2.h,width: 40.w,color: Colors.grey,)
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: Text(
                      'Verify your Identity',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Center(
                    child: Text(
                      'enter your email to reset your\n                   password',
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
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                        start: 35.w,
                        end: 35.w
                    ),
                    child: TextFormField(
                      controller: emaillController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email,color: Color(0xff519dd5),),
                        hintText: 'Email',
                        //: TextInputType.emailAddress,
                      ),
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'email is required';
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  // defaultTextfield(
                  //     controller: emaillController,
                  //     validate: (value) {
                  //       if (value?.isEmpty ?? true) {
                  //         return 'email is required';
                  //       } else {
                  //         return null;
                  //       }
                  //     },
                  //     // validate: (value)
                  //     // {
                  //     //   if(value.isEmpty)
                  //     //   {
                  //     //     return 'email must not be empty';
                  //     //   }
                  //     // },
                  //     hintText: 'Email',
                  //     type: TextInputType.emailAddress,
                  //     prefix: Icons.email
                  // ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Container(
                    height: 44.h,
                    width: 270.w,

                    decoration: BoxDecoration(
                        color:const Color(0xff2752e7) ,
                        borderRadius: BorderRadius.circular(35)
                    ),
                    child: MaterialButton(
                      onPressed:(){
                        // if(formKey.currentState!.validate())
                        if (formKey.currentState != null && formKey.currentState!.validate())
                        {
                          ForgetPassCubit.get(context).forgetPass(
                              email: emaillController.text
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>CodeVerifyScreen())
                          );
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                  // defaultBottom(
                  //     radius: 35,
                  //     color: const Color(0xff2752e7),
                  //     text: 'Next',
                  //     onpressed: ()
                  //     {
                  //       //if(formKey.currentState!.validate())
                  //       if (formKey.currentState != null && formKey.currentState!.validate())
                  //       {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(builder: (context)=>CodeVerifyScreen())
                  //         );
                  //       }
                  //     }
                  // )
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}

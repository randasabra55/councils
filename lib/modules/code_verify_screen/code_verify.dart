import 'dart:developer';

import 'package:councils/modules/login_after_forget/login_after_forget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/component/component.dart';
import '../../shared/component/constants.dart';
import '../enter_new_pass/confirm_change_pass_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class CodeVerifyScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  String? code;
  // var code1=TextEditingController();
  // var code2=TextEditingController();
  // var code3=TextEditingController();
  // var code4=TextEditingController();

 // CodeVerifyScreen({super.key, required this.code});


  @override
  Widget build(BuildContext context) {

     return BlocProvider(

       create: (BuildContext context) =>VerifyCodeCubit(),
       child: BlocConsumer<VerifyCodeCubit,CodeVerificationStates>(
         
         listener: (BuildContext context,  state) {
           if (state is CodeVerSuccessState)
             {
               Navigator.pushAndRemoveUntil(
                   context,
                   MaterialPageRoute(builder: (context)=>NewPasswordScreen()),
                       (route) => false
               );
             }
         },
         builder: (BuildContext context,  state) { 
           return  Scaffold(
             body: Form(
               key: formKey,
               child: SingleChildScrollView(
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
                             if ( formKey.currentState!.validate())
                             {
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context)=>CodeVerifyScreen())
                               );
                             }
                             //Navigator.pop(context);
                           },
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 10.h,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(height: 2.h,width: 40.w,color: Colors.grey,),
                         SizedBox(
                           width: 5.w,
                         ),
                         Container(height: 2.h,width: 40.w,color: const Color(0xff2752e7),),
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
                         'Verify Your Identity',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 24.sp,

                         ),
                       ),
                     ),
                     SizedBox(
                       height: 30.h,
                     ),
                     const Center(
                       child: Text(
                         'we send code,check your box',
                         style: TextStyle(
                             color: Colors.grey
                           //  fontWeight: FontWeight.bold,
                           //  fontSize: 24.sp,

                         ),
                       ),
                     ),
                     SizedBox(
                       height: 30.h,
                     ),
                     const Center(
                       child: Text(
                         'Enter code',
                         style: TextStyle(
                           //  color: Colors.grey
                           fontWeight: FontWeight.bold,
                           //  fontSize: 24.sp,

                         ),
                       ),
                     ),
                     SizedBox(
                       height: 45.h,
                     ),
                     OtpTextField(
                       numberOfFields: 6,
                       // borderColor: const Color(0xffd4e7f4),
                       // borderColor: Color(0xFF512DA8),
                       //set to true to show as box or false to show as dash
                       showFieldAsBox: true,
                       filled: true,

                       fillColor: const Color(0xffd4e7f4),
                       //runs when a code is typed in
                       onCodeChanged: (String code) {
                         log('randa');
                         //handle validation or checks here
                       },

                       //runs when every textfield is filled
                       onSubmit: (String verificationCode){
                        // log(verificationCode);
                         code=verificationCode;
                         // VerifyCodeCubit.get(context).OTP(
                         //     token: token,
                         //     otp: verificationCode
                         // );
                         // if (state is CodeVerSuccessState)
                         // {
                         //   Navigator.pushAndRemoveUntil(
                         //       context,
                         //       MaterialPageRoute(builder: (context)=>NewPasswordScreen()),
                         //           (route) => false
                         //   );
                         // }
                         // else if(state is CodeVerErrorState){
                         //   showToast(text: 'errorrrrr', state: ToastStates.ERROR);
                         // }

                       }, // end onSubmit
                     ),

                     SizedBox(
                       height: 25.h,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const Text(
                             'Did not receive code ?'
                         ),
                         TextButton(
                             onPressed: (){

                             },
                             child: const Text(
                               'Resend',
                               style: TextStyle(
                                   color: Color(0xffb6d6ed)
                               ),
                             )
                         )
                       ],
                     ),
                     SizedBox(
                       height: 25.h,
                     ),
                     defaultBottom(

                         radius: 35,
                         color: Color(0xff2752e7),

                         text: 'Next',
                         onpressed: ()
                         {
                           if(formKey.currentState!.validate())
                           {

                             {
                               log(code!);
                               VerifyCodeCubit.get(context).OTP(
                                   token: token,
                                   otp: code
                               );
                               log('beforrrre');
                               if (state is CodeVerSuccessState)
                               {
                                 log('success');
                                 Navigator.pushAndRemoveUntil(
                                     context,
                                     MaterialPageRoute(builder: (context)=>NewPasswordScreen()),
                                         (route) => false
                                 );
                               }
                               else if(state is CodeVerErrorState){
                                 showToast(text: 'errorrrrr', state: ToastStates.ERROR);
                               }
                               else
                                 {
                                   log('jjjjjjjjj');
                                 }

                             }

                           }

                         }
                     )

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

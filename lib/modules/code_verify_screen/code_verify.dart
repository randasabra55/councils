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
  // var code1=TextEditingController();
  // var code2=TextEditingController();
  // var code3=TextEditingController();
  // var code4=TextEditingController();

  CodeVerifyScreen({super.key});


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
                             if (formKey.currentState != null && formKey.currentState!.validate())
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
                         VerifyCodeCubit.get(context).OTP(
                             token: token,
                             otp: verificationCode
                         );
                         // if(verificationCode.isEmpty)
                         // return "code not correct";
                         // showDialog(
                         //     context: context,
                         //     builder: (context){
                         //       return AlertDialog(
                         //         title: const Text("Verification Code"),
                         //         content: Text('Code entered is $verificationCode'),
                         //       );
                         //     }
                         // );
                       }, // end onSubmit
                     ),
                     // Row(
                     //   children: [
                     //     SizedBox(
                     //       width: 36.w,
                     //     ),
                     //     SizedBox(
                     //       width: 50.w,
                     //       height: 50.h,
                     //       child: TextFormField(
                     //         controller: code1,
                     //         keyboardType: TextInputType.number,
                     //         decoration: const InputDecoration(
                     //           border: OutlineInputBorder()
                     //         ),
                     //         validator: (value){
                     //           if(value!.isEmpty)
                     //             {
                     //               return '';
                     //             }
                     //           return null;
                     //         },
                     //       ),
                     //     ),
                     //     SizedBox(
                     //       width: 30.w,
                     //     ),
                     //     SizedBox(
                     //       width: 50.w,
                     //       height: 50.h,
                     //       child: TextFormField(
                     //         controller: code2,
                     //         keyboardType: TextInputType.number,
                     //         decoration: const InputDecoration(
                     //             border: OutlineInputBorder()
                     //         ),
                     //         validator: (value){
                     //           if(value!.isEmpty)
                     //           {
                     //             return '';
                     //           }
                     //           return null;
                     //         },
                     //       ),
                     //     ),
                     //     SizedBox(
                     //       width: 30.w,
                     //     ),
                     //     SizedBox(
                     //       width: 50.w,
                     //       height: 50.h,
                     //       child: TextFormField(
                     //         controller: code3,
                     //         keyboardType: TextInputType.number,
                     //         decoration: const InputDecoration(
                     //             border: OutlineInputBorder()
                     //         ),
                     //         validator: (value){
                     //           if(value!.isEmpty)
                     //           {
                     //             return '';
                     //           }
                     //           return null;
                     //         },
                     //       ),
                     //     ),
                     //     SizedBox(
                     //       width: 30.w,
                     //     ),
                     //     SizedBox(
                     //       width: 50.w,
                     //       height: 50.h,
                     //       child: TextFormField(
                     //         controller: code4,
                     //         keyboardType: TextInputType.number,
                     //         decoration: const InputDecoration(
                     //             border: OutlineInputBorder()
                     //         ),
                     //         validator: (value){
                     //           if(value!.isEmpty)
                     //           {
                     //             return '';
                     //           }
                     //           return null;
                     //         },
                     //       ),
                     //     ),
                     //   ],
                     // ),
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
                           //  VerifyCodeCubit.get(context).OTP(token: token, otp: otp)
                             // Navigator.push(
                             //     context,
                             //     MaterialPageRoute(builder: (context)=>LoginAfterForget())
                             // );
                           }

                         }
                     )
                     // Row(
                     //   children: [
                     //     TextFormfield(
                     //
                     //        //  controller: code1,
                     //        //  hintText: '',
                     //        // validate: (value){
                     //        //    if(value.isEmpty)
                     //        //      {
                     //        //        return 'this must not be empty';
                     //        //      }
                     //        // },
                     //        // // prefix: prefix,
                     //        //  type: TextInputType.number
                     //     ),
                     //     SizedBox(
                     //       width: 5.w,
                     //     ),
                     //     defaultTextfield(
                     //         controller: code2,
                     //         hintText: '',
                     //         validate: (value){
                     //           if(value.isEmpty)
                     //           {
                     //             return 'this must not be empty';
                     //           }
                     //         },
                     //         // prefix: prefix,
                     //         type: TextInputType.number
                     //     ),
                     //     SizedBox(
                     //       width: 5.w,
                     //     ),
                     //     defaultTextfield(
                     //         controller: code3,
                     //         hintText: '',
                     //         validate: (value){
                     //           if(value.isEmpty)
                     //           {
                     //             return 'this must not be empty';
                     //           }
                     //         },
                     //         // prefix: prefix,
                     //         type: TextInputType.number
                     //     ),
                     //     SizedBox(
                     //       width: 5.w,
                     //     ),
                     //     defaultTextfield(
                     //         controller: code4,
                     //         hintText: '',
                     //         validate: (value){
                     //           if(value.isEmpty)
                     //           {
                     //             return 'this must not be empty';
                     //           }
                     //         },
                     //         // prefix: prefix,
                     //         type: TextInputType.number
                     //     ),
                     //     // SizedBox(
                     //     //   width: 5.w,
                     //     // ),
                     //   ],
                     // ),

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

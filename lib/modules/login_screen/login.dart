import 'package:councils/modules/code_verify.dart';
import 'package:councils/shared/component/component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../layouts/home_layout/home_layout_screen.dart';

class LoginScreen extends StatelessWidget {

  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                   width: 18.w,
                 ),
                 IconButton(
                   icon: const Icon(Icons.arrow_back_ios_new),
                   onPressed: (){
                     Navigator.pop(context);
                   },
                 ),
                 SizedBox(
                   width: 100.w,
                 ),
                 Text(
                   'Login',
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18.sp,
                      // fontWeight: FontWeight.bold
                   ),
                 ),
                 SizedBox(
                   width: 100.w,
                 ),
                 IconButton(
                   icon: const Icon(Icons.arrow_forward_ios_outlined),
                   onPressed: (){
                     if(formKey.currentState!.validate())
                     {
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context)=>HomeLayoutScreen())
                       );
                     }
                     //Navigator.pop(context);
                   },
                 ),
               ],
             ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Text(
                  'Hello Welcome Back',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
          
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Center(
                child: Text(
                  'Welcome back, please \n        sign in again',
                  style: TextStyle(
                      color: Colors.grey
                    //  fontWeight: FontWeight.bold,
                    //  fontSize: 24.sp,
          
                  ),
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              defaultTextfield(
                  controller: emailController,
                  validate: (value)
                  {
                    if(value.isEmpty)
                      {
                        return "email must not be empty";
                      }
                  },
                  hintText:'Email',
                  prefix: Icons.email,
                  type: TextInputType.emailAddress
              ),
              SizedBox(
                height: 25.h,
              ),
              defaultTextfield(
                  controller: passwordController,
                  validate: (value)
                  {
                    if(value.isEmpty)
                    {
                      return "password must not be empty";
                    }
                  },
                  hintText:'Password',
                  prefix: Icons.lock,
                  type: TextInputType.visiblePassword
              ),
          
              TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>CodeVerifyScreen())
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: 20,
                      top: 8
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forget password?',
                        style: TextStyle(
                            color:Color(0xff519dd5)
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 8.h,
              ),
              defaultBottom(
          
          
                  radius:30,
                  color: Color(0xff2752e7),
                  text:'Login',
                  onpressed: (){
                    if(formKey.currentState!.validate())
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> HomeLayoutScreen())
                        );
                      }
          
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}

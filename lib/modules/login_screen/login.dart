import 'dart:developer';
import 'package:councils/modules/forget_password_screen/forget_password.dart';
import 'package:councils/modules/login_screen/cubit/cubit.dart';
import 'package:councils/shared/component/component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../layouts/home_layout/home_layout_screen.dart';
import '../../shared/component/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserLoginCubit(),
      child: BlocConsumer<UserLoginCubit, UserLoginStates>(
        listener: (BuildContext context, state) {
          if (state is UserLoginSuccessState) {
            if (state.loginModel.result!) {
              //print(state.loginModel.message);
              log('${state.loginModel.token}');
              CacheHelper.saveData(key: 'token', value: state.loginModel.token)
                  .then((value) {
                token = state.loginModel.token!;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeLayoutScreen()),
                    (route) => false);
                // navigateAndFinish(context, HomeLayoutScreen());
              });
            } else {
              // print(state.loginModel.message);
              showToast(
                  text: 'email or password not correct',
                  state: ToastStates.ERROR);
            }
          }
          // if (state is UserLoginSuccessState) {
          //   if (state.loginModel.status!) {
          //     log(state.loginModel.message);
          //     //  log(state.loginModel.data?.token);
          //     CacheHelper.saveData(
          //         key: 'token', value: state.loginModel.data?.token).then((
          //         value) {
          //       token = state.loginModel.data!.token!;
          //       Navigator.pushAndRemoveUntil(
          //           context,
          //           MaterialPageRoute(builder: (context) => HomeLayoutScreen()),
          //               (route) => false
          //       );
          //       // Navigator.push(context, route)
          //       //  navigateAndFinish(context, ShopLayout());
          //     });
          //   }
          //   //  );
          //
          //   else {
          //     log(state.loginModel.message);
          //     showToast(text: 'error', state: ToastStates.ERROR);
          //   }
          // }
        },
        // }},
        builder: (BuildContext context, Object? state) {
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
                          onPressed: () {
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeLayoutScreen()));

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
                        style: TextStyle(color: Colors.grey
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
                        validate: (value) {
                          if (value.isEmpty) {
                            return "email must not be empty";
                          }
                        },
                        hintText: 'Email',
                        prefix: Icons.email,
                        type: TextInputType.emailAddress),
                    SizedBox(
                      height: 25.h,
                    ),
                    defaultTextfield(
                        controller: passwordController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return "password must not be empty";
                          }
                        },
                        hintText: 'Password',
                        prefix: Icons.lock,
                        type: TextInputType.visiblePassword),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgetPasswordScreen()));
                        },
                        child: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 20, top: 8),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Forget password?',
                              style: TextStyle(color: Color(0xff519dd5)),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 8.h,
                    ),
                    defaultBottom(
                        radius: 30,
                        color: Color(0xff2752e7),
                        text: 'Login',
                        onpressed: () {
                          if (formKey.currentState!.validate()) {
                            UserLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context)=> HomeLayoutScreen())
                            // );
                          }
                        })
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

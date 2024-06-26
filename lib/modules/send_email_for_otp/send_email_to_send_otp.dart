import 'package:councils/modules/code_verify_screen/code_verify.dart';
import 'package:councils/modules/forget_password_screen/cubit/cubit.dart';
import 'package:councils/modules/forget_password_screen/cubit/states.dart';
import 'package:councils/shared/component/component.dart';
import 'package:councils/shared/component/constants.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendEmailToSendOTP extends StatelessWidget {
  //const SendEmailToSendOTP({super.key});
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPassCubit(),
      child: BlocConsumer<ForgetPassCubit, ForgetPassStates>(
        listener: (BuildContext context, state) {
          if (state is ForgetPassSuccessState) {
            //  CacheHelper.saveData(key: 'token', value: state.loginModel.token);
            //  token=state.loginModel.token!;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => CodeVerifyScreen()),
                (route) => false);
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: defaultTextfield(
                      controller: emailController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return "email must not be empty";
                        }
                      },
                      hintText: 'Email',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress),
                ),
                SizedBox(
                  height: 50.h,
                ),
                defaultBottom(
                    radius: 30,
                    color: Color(0xff2752e7),
                    text: 'send code',
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        ForgetPassCubit.get(context)
                            .forgetPass(email: emailController.text);
                        // UserLoginCubit.get(context).userLogin(
                        //     email: emailController.text,
                        //     password: passwordController.text
                        // );
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context)=> CodeVerifyScreen())
                        // );
                      }
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}

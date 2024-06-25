import 'package:councils/modules/done_verify/done_screen.dart';
import 'package:councils/modules/login_after_forget/cubit/cubit.dart';
import 'package:councils/modules/login_after_forget/cubit/states.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/component/component.dart';
import '../../shared/component/constants.dart';

class LoginAfterForget extends StatelessWidget {

  var passwordController=TextEditingController();
  var passwordController2=TextEditingController();
  var formKey=GlobalKey<FormState>();
  //String? token;

  LoginAfterForget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AddNewPassCubit(),
      child: BlocConsumer<AddNewPassCubit,AddNewPasswordStates>(

        listener: (BuildContext context, AddNewPasswordStates state) {
          if(state is AddNewPassSuccessState)
            {
              if(state.addNewPassModel.result!)
                {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context)=>DoneScreen()),
                          (route) => false
                  );
                  token=CacheHelper.getData(key: 'token');

                }
            }
        },
        builder: (BuildContext context, AddNewPasswordStates state) {
          return Scaffold(
            // appBar: AppBar(
            //   leading: IconButton(
            //     icon: const Icon(Icons.arrow_back_ios_new),
            //     onPressed: (){
            //       Navigator.pop(context);
            //     },
            //   ),
            //   title: const Text(
            //     'Login',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold
            //     ),
            //
            //   ),
            //   centerTitle: true,
            // ),
            body: SingleChildScrollView(

              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
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
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 2.h,width: 40.w,color: Colors.grey,),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(height: 2.h,width: 40.w,color: Colors.grey,),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(height: 2.h,width: 40.w,color: const Color(0xff2752e7),)
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
                      height: 18.h,
                    ),
                    const Center(
                      child: Text(
                        'Enter new password',
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
                        controller: passwordController,
                        hintText:'Password',
                        prefix: Icons.lock,
                        type: TextInputType.visiblePassword,
                        validate: (value)
                        {
                          if(value.isEmpty)
                          {
                            return 'password must not be empty';
                          }
                        }
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    defaultTextfield(
                        controller: passwordController2,
                        hintText:'Confirm new password',
                        prefix: Icons.lock,
                        type: TextInputType.visiblePassword,
                        validate: (value)
                        {
                          if(value.isEmpty)
                          {
                            return 'password must not be empty';
                          }
                        }
                    ),


                    SizedBox(
                      height: 50.h,
                    ),
                    defaultBottom(


                        radius:30,
                        color: const Color(0xff2752e7),
                        text:'Done',
                        onpressed: (){
                          if(formKey.currentState!.validate())
                          {
                            AddNewPassCubit.get(context).AddNewPass(
                                token: token!,
                                password: passwordController.text,
                                confirmPass: passwordController2.text
                            );
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context)=>const DoneScreen())
                            // );
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

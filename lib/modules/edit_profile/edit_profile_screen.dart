import 'package:councils/modules/chair_man_profile/chair_man_profile.dart';
import 'package:councils/modules/edit_profile/cubit/cubit.dart';
import 'package:councils/modules/edit_profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {

  var degreeController=TextEditingController();
  var emailController=TextEditingController();
  var numberController=TextEditingController();
  var addressController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmPassController=TextEditingController();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit,EditProfileStates>(
        listener: (BuildContext context, EditProfileStates state) {  },
        builder: (BuildContext context, EditProfileStates state) {
          EditProfileCubit cubit=EditProfileCubit.get(context);
          bool ispass=cubit.isPass;
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
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                  ),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                'Edit',
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          // backgroundColor: Colors.white,
                          radius: 55.r,
                          backgroundImage: const NetworkImage('https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1710455070~exp=1710458670~hmac=b93e3f5338c24953a021bf8db8ce3c18cf68345fbf21fe810d5962b04b3d7595&w=996'),
                        ),
                        Card(

                          elevation: 2,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15.r,
                            child: IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.blue,
                                  size: 19.sp,
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 25,
                    ),
                    child:  Text(

                      'Degree',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25.0,
                        end: 25
                    ),
                    child: SizedBox(
                      height: 40.h,

                      child: TextFormField(
                        controller: degreeController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r)
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 25,
                    ),
                    child:  Text(

                      'Email',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25.0,
                        end: 25
                    ),
                    child: SizedBox(
                      height: 40.h,
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r)
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 25,
                    ),
                    child:  Text(

                      'Phone Number',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25.0,
                        end: 25
                    ),
                    child: SizedBox(
                      height: 40.h,
                      child: TextFormField(
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r)
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 25,
                    ),
                    child:  Text(

                      'Address',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25.0,
                        end: 25
                    ),
                    child: SizedBox(
                      height: 40.h,
                      child: TextFormField(
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r)
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 25,
                    ),
                    child:  Text(

                      'Password',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25.0,
                        end: 25
                    ),
                    child: SizedBox(
                      height: 40.h,
                      child: TextFormField(
                        controller: passwordController,
                       // keyboardType: TextInputType.number,
                        obscureText: ispass,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              cubit.passwordShow();
                            },
                            icon:ispass?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r)
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                      start: 25.w,
                    ),
                    child:  Text(

                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25.0,
                        end: 25
                    ),
                    child: SizedBox(
                      height: 40.h,
                      child: TextFormField(
                        controller: confirmPassController,
                        keyboardType: TextInputType.number,
                        obscureText: isConfirmPass,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              cubit.passwordConfirmShow();
                            },
                            icon:isConfirmPass?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r)
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 25.w
                    ),
                    child: MaterialButton(

                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> ChairManProfile())
                        );
                      },
                      color: const Color(0xff2752e7),
                      minWidth: 250.w,
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
            ),
          );
        },

      ),
    );
  }
}

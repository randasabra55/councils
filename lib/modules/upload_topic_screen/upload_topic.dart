import 'dart:developer';
import 'package:councils/shared/component/component.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/network/local/cache_helper.dart';
import '../topics/topics_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class UploadTopic extends StatelessWidget {
 // const UploadTopic({super.key});
  var typeController=TextEditingController();
  var titleController=TextEditingController();
  var councilId=CacheHelper.getData(key: 'councilId');
  UploadTopic({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>TopicUploadCubit(),

      child: BlocConsumer<TopicUploadCubit,UploadTopics>(
        listener: (BuildContext context, state) {
          if(state is UploadTopicSuccessState)
            {
              log('==================');
              log(state.message);
              showToast(text: state.message, state: ToastStates.SUCCESS);

              Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context)=>const TopicsScreen())
               );
            }
          else if(state is UploadTopicErrorState)
            {
              showToast(text: 'topic can\'t uploaded', state: ToastStates.ERROR);
            }
          // if (state is UploadFileSelectedState) {
          //   // Show a message or update the UI to indicate that a file has been selected
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('File selected: ${state.selectedFile.name}')),
          //   );
          // }
        },
        builder: (BuildContext context,  state) {
          TopicUploadCubit cubit=TopicUploadCubit.get(context);
         // bool isChooseUplood=cubit.isUploadButton;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 8.w,
                      ),
                      IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon:  Icon(Icons.arrow_back,size: 30.sp,)
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Up coming meeting',
                        style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                        left: 110.w
                    ),
                    child: Text(
                      'Add new topic',
                      style: TextStyle(
                          fontSize: 21.sp
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                        start: 20.w,
                        top: 5.h
                    ),
                    child: Text(
                      'Title',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                        start: 20.w,
                        end: 20.w
                    ),
                    child: SizedBox(
                      height: 45.h,
                      child: TextFormField(
                        controller: titleController,
                        cursorColor: Colors.black,
                        //  obscureText: isConfirmPass,
                        // keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'topic 1',
                            // suffixIcon: IconButton(
                            //   onPressed: (){
                            //  //   cubit.passwordConfirmShow();
                            //   },
                            // //  icon:isConfirmPass?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                            // ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black,),
              
                                borderRadius: BorderRadius.all(Radius.circular(16.r),)
                            ),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blue,),
              
                                borderRadius: BorderRadius.all(Radius.circular(12.r),)
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                        start: 20.w,
                        top: 5.h
                    ),
                    child: Text(
                      'Type',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                        start: 20.w,
                        end: 20.w
                    ),
                    child: SizedBox(
                      height: 45.h,
                      child: TextFormField(
                        controller: typeController,
                        cursorColor: Colors.black,
                        //  obscureText: isConfirmPass,
                        // keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'collage topic',
              
                            // suffixIcon: IconButton(
                            //   onPressed: (){
                            //  //   cubit.passwordConfirmShow();
                            //   },
                            // //  icon:isConfirmPass?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                            // ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black,),
              
                                borderRadius: BorderRadius.all(Radius.circular(16.r),)
                            ),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blue,),
              
                                borderRadius: BorderRadius.all(Radius.circular(12.r),)
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                        left: 32.w
                    ),
                    child: Text(
                      'Upload Topic',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 32.w,
                        end: 32.w
                    ),
                    child: GestureDetector(
                      onTap: ()
                      {
                        TopicUploadCubit.get(context).uploadTopicFromPhone();
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12.r),
                        dashPattern: const [6, 3],
                        color: Colors.grey,
                        child: SizedBox(
                          width: double.infinity,
                          height: 140.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload_file, size: 40.sp, color: Colors.black),
                              SizedBox(height: 10.h,),

                              Text(
                                cubit.selectedFile==null?'Upload a PDF file':(cubit.selectedFile!.name),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  // Padding(
                  //   padding:  EdgeInsetsDirectional.only(
                  //       start: 32.w,
                  //       end: 32.w
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: MaterialButton(
                  //           onPressed: () {
                  //             cubit.cancelButton();
                  //            // cubit.uploadButton();
                  //           },
                  //           height: 43.h,
                  //           minWidth: 160.w,
                  //           shape: RoundedRectangleBorder(
                  //             //  side:new  BorderSide(color: Color(0xFF2A8068)), //the outline color
                  //               borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  //           // color: const Color(0xff2752e7),
                  //           color:!isChooseUplood? Colors.blue:Colors.white,
                  //         //  color: Colors.blue,
                  //           child: Text(
                  //             'Cancel',
                  //             style: TextStyle(
                  //                 fontSize: 17.sp,
                  //                  color:!isChooseUplood? Colors.white:Colors.black
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 10.w,
                  //       ),
                  //       Expanded(
                  //         child: MaterialButton(
                  //           onPressed: () {
                  //             cubit.uploadButton();
                  //           },
                  //           height: 43.h,
                  //           minWidth: 160.w,
                  //           shape: RoundedRectangleBorder(
                  //             //  side:new  BorderSide(color: Color(0xFF2A8068)), //the outline color
                  //               borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  //           // color: const Color(0xff2752e7),
                  //           color:isChooseUplood? Colors.blue:Colors.white,
                  //          // color: Colors.blue,
                  //           child: Text(
                  //             'Upload',
                  //             style: TextStyle(
                  //                 fontSize: 17.sp,
                  //                 color:isChooseUplood? Colors.white:Colors.black
                  //                // color: Colors.white
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                      start: 60.w,
                     // end: 30.w
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        // Validate and log the inputs
                        log('Title: ${titleController.text}');
                        log('Type: ${typeController.text}');
                        log('Attachment: ${cubit.selectedFile?.name}');
                        log('council id ${cubit.councilId}');
                        // Make the API call
                        cubit.uploadTopic(
                          title: titleController.text,
                          type: typeController.text,
                          councilId: councilId,
                         // attachment: cubit.selectedFile,
                        );

                        // Navigate to the next screen after upload
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const TopicsScreen()),
                        // );
                      },

                      // onPressed: ()  {
                      //   cubit.uploadTopic(
                      //       title: titleController.text,
                      //       type: typeController.text,
                      //      //attachment: cubit.selectedFile,
                      //      // attachment: cubit.selectedFile!.path.toString(),
                      //     councilId: councilId,
                      //
                      //      // attachment: cubit.selectedFile
                      //   );
                      //   log("========${councilId.toString()}");
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context)=>const TopicsScreen())
                      //   );
                      // },
                      color: const Color(0xff2752e7),
                      minWidth: 250.w,
                      height:45.h ,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10.r)
                      ),
                      child: Text(
                        'ADD',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}

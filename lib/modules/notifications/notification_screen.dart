
import 'package:councils/models/notification_model/notification_item_model.dart';
import 'package:councils/modules/notifications/cubit/cubit.dart';
import 'package:councils/modules/notifications/cubit/states.dart';
import 'package:councils/modules/notifications/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  //const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(

      create: (BuildContext context) =>NotificationCubit()..getNotification(),
      child: BlocConsumer<NotificationCubit,NotificationStates>(

        listener: (BuildContext context, NotificationStates state) {  },
        builder: (BuildContext context, NotificationStates state) {
          final cubit=NotificationCubit.get(context);
          final model=cubit.getNotificationModel;

        //  NotificationCubit cubit=NotificationCubit.get(context);

          // List<NotificationModel>model=[
          //   NotificationModel(text: 'You have been invited to attend a Meeting 1 ', time: 'just now', ),
          //    NotificationModel(text: 'gggggg', time:'just now',),
          //    NotificationModel(text: 'gggggg', time: 'just now',),
          //    NotificationModel(text: 'gggggg', time: 'just now',),
          //    NotificationModel(text: 'gggggg', time: 'just now',),
          // ];
         //  List<NotificationModel>model=[];
          if(model?.values==null) {
            return Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          // color: Colors.blue,
                        ),
                        onPressed: (){
                           Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 130.h,
                  ),
                  const Image(
                      image:AssetImage('assets/images/notification.png')
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        // color: Colors.blue,
                      ),
                      onPressed: (){
                         Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Notification',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 30.sp,
                      ),
                      onPressed: (){
                        // Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.builder(
                      itemBuilder:(context,index)=>NotificationItemScreen(model: model!.values![index]),
                      itemCount: model?.values?.length,
                  ),
                )
                // Expanded(
                //   child: ListView.builder(
                //
                //     itemBuilder: (BuildContext context, int index) {
                //       return Column(
                //
                //         children: [
                //           Padding(
                //             padding:  EdgeInsetsDirectional.only(
                //                 start: 25.w,
                //                 end: 20.w
                //             ),
                //             child: Row(
                //               children: [
                //                 CircleAvatar(
                //                   radius: 25.r,
                //                   backgroundColor: Colors.blue,
                //                 ),
                //                 SizedBox(
                //                   width: 10.w,
                //                 ),
                //                 Text(
                //                   'You have been invited to \n attend a Meeting 1 ',
                //                   maxLines: 5,
                //                   overflow: TextOverflow.ellipsis,
                //                   style: TextStyle(
                //                     fontSize: 16.sp,
                //
                //                   ),
                //                 ),
                //                 Spacer(),
                //                 Text(
                //                   'just now',
                //                   style: TextStyle(
                //                       color: Colors.grey
                //                   ),
                //                 ),
                //
                //               ],
                //             ),
                //           ),
                //           SizedBox(
                //             height: 15.h,
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Container(
                //                 height: 35.h,
                //                 width: 90.w,
                //
                //                 child: MaterialButton(
                //
                //                   onPressed: (){
                //                     cubit.accept();
                //                   },
                //                   shape:  RoundedRectangleBorder(
                //                       borderRadius: BorderRadiusDirectional.circular(6.r)
                //                   ),
                //                   child: Text(
                //                     'Reject',
                //                     style: TextStyle(
                //                         fontSize: 14.sp,
                //                         color:isAccepted? Colors.grey[600]: Colors.white
                //                     ),
                //                   ),
                //                   color:isAccepted? Colors.grey[100]:Colors.blue,
                //
                //
                //                 ),
                //               ),
                //               SizedBox(
                //                 width: 12.w,
                //               ),
                //               Container(
                //                 height: 35.h,
                //                 width: 90.w,
                //                 child: MaterialButton(
                //                   onPressed: (){
                //                     cubit.accept();
                //                   },
                //                   shape:  RoundedRectangleBorder(
                //                       borderRadius: BorderRadiusDirectional.circular(6.r)
                //                   ),
                //                   child: Text(
                //                     'Accept',
                //                     style: TextStyle(
                //                         fontSize: 14.sp,
                //                         color:isAccepted? Colors.white:Colors.grey[600]
                //                     ),
                //                   ),
                //                   color:isAccepted? Colors.blue:Colors.grey[100],
                //                   //  color: Colors.grey[100],
                //                 ),
                //               )
                //             ],
                //           ),
                //           SizedBox(
                //             height: 15.h,
                //           ),
                //         ],
                //       );
                //     },
                //     itemCount: 15,
                //
                //   ),
                // ),
              ],
            ),
          );
          }
           // itemBuilder: (BuildContext context, int index) {

          //  },

            // child: Scaffold(
            //   body: Column(
            //
            //     children: [
            //       SizedBox(
            //         height: 40.h,
            //       ),
            //       Row(
            //         children: [
            //           SizedBox(
            //             width: 10.w,
            //           ),
            //           IconButton(
            //             icon: Icon(
            //               Icons.arrow_back,
            //               // color: Colors.blue,
            //             ),
            //             onPressed: (){
            //               // Navigator.pop(context);
            //             },
            //           ),
            //           SizedBox(
            //             width: 10.w,
            //           ),
            //           Text(
            //             'Notification',
            //             style: TextStyle(
            //                 fontSize: 24.sp,
            //                 fontWeight: FontWeight.w500
            //             ),
            //           ),
            //           Spacer(),
            //           IconButton(
            //             icon: Icon(
            //               Icons.search,
            //               color: Colors.blue,
            //               size: 30.sp,
            //             ),
            //             onPressed: (){
            //               // Navigator.pop(context);
            //             },
            //           ),
            //           SizedBox(
            //             width: 12.w,
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 10.h,
            //       ),
            //       Column(
            //
            //         children: [
            //           Padding(
            //             padding:  EdgeInsetsDirectional.only(
            //                 start: 25.w,
            //                 end: 20.w
            //             ),
            //             child: Row(
            //               children: [
            //                 CircleAvatar(
            //                   radius: 25.r,
            //                   backgroundColor: Colors.blue,
            //                 ),
            //                 SizedBox(
            //                   width: 10.w,
            //                 ),
            //                 Text(
            //                   'You have been invited to \n attend a Meeting 1 ',
            //                   maxLines: 5,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: TextStyle(
            //                     fontSize: 16.sp,
            //
            //                   ),
            //                 ),
            //                 Spacer(),
            //                 Text(
            //                   'just now',
            //                   style: TextStyle(
            //                       color: Colors.grey
            //                   ),
            //                 ),
            //
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             height: 15.h,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Container(
            //                 height: 35.h,
            //                 width: 90.w,
            //
            //                 child: MaterialButton(
            //
            //                   onPressed: (){
            //                     cubit.accept();
            //                   },
            //                   shape:  RoundedRectangleBorder(
            //                       borderRadius: BorderRadiusDirectional.circular(6.r)
            //                   ),
            //                   child: Text(
            //                     'Reject',
            //                     style: TextStyle(
            //                         fontSize: 14.sp,
            //                         color:isAccepted? Colors.grey[600]: Colors.white
            //                     ),
            //                   ),
            //                   color:isAccepted? Colors.grey[100]:Colors.blue,
            //
            //
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 12.w,
            //               ),
            //               Container(
            //                 height: 35.h,
            //                 width: 90.w,
            //                 child: MaterialButton(
            //                   onPressed: (){
            //                     cubit.accept();
            //                   },
            //                   shape:  RoundedRectangleBorder(
            //                       borderRadius: BorderRadiusDirectional.circular(6.r)
            //                   ),
            //                   child: Text(
            //                     'Accept',
            //                     style: TextStyle(
            //                         fontSize: 14.sp,
            //                         color:isAccepted? Colors.white:Colors.grey[600]
            //                     ),
            //                   ),
            //                   color:isAccepted? Colors.blue:Colors.grey[100],
            //                   //  color: Colors.grey[100],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
         // ;
        },


      ),
    );
  }

}

// Widget notificationItem(context,NotificationModel model)
// {
//   NotificationCubit cubit=NotificationCubit.get(context);
//   //bool isAccepted=model.isAccept;
//   return Column(
//
//     children: [
//       Padding(
//         padding:  EdgeInsetsDirectional.only(
//             start: 25.w,
//             end: 20.w
//         ),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 25.r,
//               backgroundColor: Colors.blue,
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Text(
//               '${model.text}',
//              // 'You have been invited to \n attend a Meeting 1 ',
//               maxLines: 5,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontSize: 16.sp,
//
//               ),
//             ),
//             Spacer(),
//             Text(
//               '${model.time}',
//               //'just now',
//               style: TextStyle(
//                   color: Colors.grey
//               ),
//             ),
//
//           ],
//         ),
//       ),
//       SizedBox(
//         height: 15.h,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 35.h,
//             width: 90.w,
//
//             child: MaterialButton(
//
//                 onPressed: (){
//                     cubit.reject();
//                 },
//                 shape:  RoundedRectangleBorder(
//                     borderRadius: BorderRadiusDirectional.circular(6.r)
//                 ),
//                 child:  Text(
//                   'Reject',
//                   style: TextStyle(
//                       fontSize: 14.sp,
//                     //  color: Colors.grey[600]
//                        color:model.isAccept? Colors.grey[600]: Colors.white
//                   ),
//                 ),
//                // color: Colors.grey[100]
//                color:model.isAccept? Colors.grey[100]:Colors.blue,
//
//
//             ),
//           ),
//           SizedBox(
//             width: 12.w,
//           ),
//           Container(
//             height: 35.h,
//             width: 90.w,
//             child: MaterialButton(
//                 onPressed: (){
//                    cubit.accept();
//                 },
//                 shape:  RoundedRectangleBorder(
//                     borderRadius: BorderRadiusDirectional.circular(6.r)
//                 ),
//                 child: Text(
//                   'Accept',
//                   style: TextStyle(
//                       fontSize: 14.sp,
//                     //  color: Colors.white
//                       color:model.isAccept? Colors.white:Colors.grey[600]
//                   ),
//                 ),
//               //  color: Colors.blue
//                 color:model.isAccept? Colors.blue:Colors.grey[100],
//               //  color: Colors.grey[100],
//             ),
//           )
//         ],
//       ),
//       SizedBox(
//         height: 15.h,
//       ),
//     ],
//   );
// }



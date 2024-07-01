import 'package:councils/models/getAllTopic.dart';
import 'package:councils/modules/meeting/cubit/cubit.dart';
import 'package:councils/modules/topics/cubit/cubit.dart';
import 'package:councils/modules/topics/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/component/component.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

 // TopicsScreen({super.key});
 //  bool? isDes;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>TopicCubit()..getAllTopics(),
      child: BlocConsumer<TopicCubit,TopicStates>(

        listener: (BuildContext context, state) {
          if(state is GetAllTopicSuccessState)
            {
              if(GetAllMeetingCubit.get(context).getCouncilModel==null) {
                showToast(text: 'empty list', state:ToastStates.ERROR ,);
              }
            }
          else if(state is GetAllTopicErrorState)
            {
              showToast(text: 'error', state:ToastStates.ERROR ,);
            }
        },
        builder: (BuildContext context, Object? state) {
          TopicCubit cubit=TopicCubit.get(context);
        //  final getTopic=cubit.getAllTopicModel;
          bool isShowCategoryList=cubit.isShowCategoryList;
          // List<TopicItemModel>model=[
          //   TopicItemModel(name: 'Topic 1', code: '6510'),
          //   TopicItemModel(name: 'Topic 2', code: '6511'),
          //   TopicItemModel(name: 'Topic 3', code: '6512'),
          //   TopicItemModel(name: 'Topic 4', code: '6513'),
          //   TopicItemModel(name: 'Topic 5', code: '6514'),
          //   TopicItemModel(name: 'Topic 1', code: '6510'),
          //   TopicItemModel(name: 'Topic 2', code: '6511'),
          //   TopicItemModel(name: 'Topic 3', code: '6512'),
          //   TopicItemModel(name: 'Topic 4', code: '6513'),
          //   TopicItemModel(name: 'Topic 5', code: '6514'),
          // ];
          String selectedCategory=cubit.isSelected;
          String decision='Made Decision';
          bool isDes=cubit.isDecision;
         // GetAllTopicModel? model=TopicCubit.get(context).getAllTopicModel;
          final cubitt = TopicCubit.get(context);
          final topicModel = cubitt.getAllTopicModel?.values;
          return Scaffold(
            body: Column(
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
                      'Topics',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 230.w,
                    ),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(
                          end: 20.w
                      ),

                      child: GestureDetector(
                        onTap: (){
                          cubit.showCategoryList();
                        },
                        child: Container(
                          height: 35.h,
                          width: 98.w,
                          decoration: BoxDecoration(
                            color: const Color(0xff5669ff),
                            borderRadius: BorderRadius.circular(20.r),

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius:10.r,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.filter_list,size: 16.sp,color: const Color(0xff5669ff),)
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              const Text(
                                'Categories',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if(isShowCategoryList)
                  Row(
                    children: [
                      SizedBox(
                        width: 160.w,
                      ),
                      Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Container(

                          height: 75.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:  EdgeInsetsDirectional.only(
                              start: 10.w,
                              top: 10.h
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Row(
                                //   children: [
                                //     GestureDetector(
                                //       onTap: (){
                                //         cubit.SelectedItem('Priority');
                                //        // selectedCategory='Priority';
                                //       },
                                //       child: Text(
                                //         'Priority',
                                //         style: TextStyle(
                                //           fontSize: 16.sp,
                                //           color: selectedCategory=='Priority'?const Color(0xff5669ff):Colors.black,
                                //
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 30.w,
                                //     ),
                                //     Icon(
                                //       Icons.check,
                                //       color: selectedCategory=='Priority'?const Color(0xff5669ff):Colors.white,
                                //     )
                                //   ],
                                // ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        cubit.SelectedItem('Date');
                                       // selectedCategory='Date';
                                      },
                                      child: Text(
                                          'Date',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                          color: selectedCategory=='Date'?const Color(0xff5669ff):Colors.black,

                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 45.w,
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: selectedCategory=='Date'?const Color(0xff5669ff):Colors.white,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        cubit.SelectedItem('Name');
                                        cubitt.getTopicByName();

                                       // selectedCategory='Name';
                                      },
                                      child: Text(
                                          'Name',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: selectedCategory=='Name'?const Color(0xff5669ff):Colors.black,

                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 38.w,
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: selectedCategory=='Name'?const Color(0xff5669ff):Colors.white,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context,index)=>topicItem(topicModel?[index]),
                      itemCount: topicModel?.length,
                  ),
                )
              ],
            ),
          );
        },

      ),
    );
  }
}

Widget topicItem(topicInfo? model) {
 // bool isDes = false;
 // List<String> list = <String>['Public', 'Private'];
  return Padding(
    padding: EdgeInsetsDirectional.only(
      start: 20.w,
      end: 20.w,
      //top: 5.h
    ),
    child: Card(
      elevation: 1,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            height: 55.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 18.w,
                end: 8.w,
                top: 7.h
              ),
              child: Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            // 'Topic 1',
                            model?.title??'',
                           // model.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     const Text(
                          //       'Code:',
                          //       style: TextStyle(
                          //         // fontWeight: FontWeight.bold
                          //       ),
                          //     ),
                          //     Text(
                          //       // '1650',
                          //       model.code,
                          //       style: const TextStyle(
                          //         // fontWeight: FontWeight.bold
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      const Spacer(),

                      IconButton(
                        onPressed: () {
                          // TopicCubit.get(context).decesions();
                        },
                        icon: const Image(
                          image: AssetImage('assets/images/legal-01.png'),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage('assets/images/dots.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
         
        ],
      ),
    ),
  );
}


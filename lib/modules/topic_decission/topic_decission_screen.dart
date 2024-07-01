import 'package:councils/modules/topic_decission/cubit/cubit.dart';
import 'package:councils/modules/topic_decission/cubit/states.dart';
import 'package:councils/modules/topics/topics_screen.dart';
import 'package:councils/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopicDecissionScreen extends StatelessWidget {
  //const TopicDecissionScreen({super.key});
  var resultController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (BuildContext context) =>TopicDecisionCubit(),
      child: BlocConsumer<TopicDecisionCubit,TopicDecisionStates>(
        listener: (BuildContext context, state) { 
          if(state is TopicDecisionSuccessState)
            {
              showToast(text: state.message, state: ToastStates.SUCCESS);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>TopicsScreen())
              );
            }
          else if(state is TopicDecisionErrorState)
            {
              showToast(text: 'result can\'t be uploaded', state: ToastStates.ERROR);
            }
        },
        builder: (BuildContext context, Object? state) { 
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
                      'Made Decision',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 20.w
                  ),
                  child: Text(
                    'Result',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(
                    height: 8.h
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 20.w
                  ),
                  child: TextField(
                    controller: resultController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                    height: 100.h
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(
                    start: 50.w,
                    //end: 20.w
                  ),
                  child: defaultBottom(
                      radius: 20,
                      text: 'Submit',
                      onpressed: (){
                        TopicDecisionCubit.get(context).topicDecision(result: resultController.text);
                      },
                      color:Color(0xff2752e7)
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

// import 'dart:developer';
// import 'package:councils/modules/meeting/cubit/cubit.dart';
// import 'package:councils/modules/topic_decission/cubit/states.dart';
// import 'package:councils/shared/component/constants.dart';
// import 'package:councils/shared/network/local/cache_helper.dart';
// import 'package:councils/shared/network/remote/dio_helper.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../shared/network/end_point.dart';
//
// class TopicDecisionCubit extends Cubit<TopicDecisionStates>
// {
//   TopicDecisionCubit():super(TopicDecisionInitialState());
//
//   static TopicDecisionCubit get(context)=>BlocProvider.of(context);
//   String? message;
//   String? token=CacheHelper.getData(key: 'token');
//   int? councilId=CacheHelper.getData(key: 'councilId');
//   int? topicId=CacheHelper.getData(key: 'topicId');
//
//   void topicDecision({
//     required String result
// })
//   {
//     DioHelper.postData(
//         url: ADDRESULTTOTOPIC,
//         data: {
//          // 'councilId':GetAllMeetingCubit.get(context).councilIds,
//         //  'councilId':GetAllMeetingCubit.get(context).CouncilId,
//           'councilId':councilId,
//           'topicId':topicId,
//           'result':result
//         },
//       token: token
//     ).then((value) {
//       log('council_id ${councilId.toString()}');
//       message=value.data.toString();
//       emit(TopicDecisionSuccessState(message!));
//     }).catchError((error){
//       log('error is ${error.toString()}');
//       emit(TopicDecisionErrorState(error));
//     });
//   }
// }


import 'dart:developer';

import 'package:councils/modules/topic_decission/cubit/states.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/end_point.dart';

class TopicDecisionCubit extends Cubit<TopicDecisionStates> {
  TopicDecisionCubit() : super(TopicDecisionInitialState());

  static TopicDecisionCubit get(context) => BlocProvider.of(context);
  String? message;
  String? token = CacheHelper.getData(key: 'token');
  int? councilId = CacheHelper.getData(key: 'councilId');
  int? topicId = CacheHelper.getData(key: 'topicId');
 // log('Cached councilId: $councilId');
 // log('Cached topicId: $topicId');
  void topicDecision({required String result}) {
    councilId = CacheHelper.getData(key: 'councilId');
    topicId = CacheHelper.getData(key: 'topicId');

    log('Cached councilId: $councilId');
    log('Cached topicId: $topicId');
    // التحقق من صحة القيم قبل إرسال الطلب
    if (councilId == null) {
      emit(TopicDecisionErrorState("Council ID is null"));
      log('Council ID is null');
      return;
    }

    if (topicId == null) {
      emit(TopicDecisionErrorState("Topic ID is null"));
      log('Topic ID is null');
      return;
    }

    final data = {
      'councilId': councilId,
      'topicId': topicId,
      'result': result,
    };

    log('Sending data: $data with token: $token');

    DioHelper.postData(
      url: ADDRESULTTOTOPIC,
      data: data,
      token: token,
    ).then((value) {
      log('Response received: ${value.data.toString()}');
      message = value.data.toString();
      emit(TopicDecisionSuccessState(message!));
    }).catchError((error) {
      log('Error: ${error.toString()}');
      emit(TopicDecisionErrorState(error.toString()));
    });
  }
}

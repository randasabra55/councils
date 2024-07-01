import 'dart:developer';
import 'package:councils/modules/meeting/cubit/cubit.dart';
import 'package:councils/modules/topic_decission/cubit/states.dart';
import 'package:councils/shared/component/constants.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../../../shared/network/end_point.dart';

class TopicDecisionCubit extends Cubit<TopicDecisionStates>
{
  TopicDecisionCubit():super(TopicDecisionInitialState());

  static TopicDecisionCubit get(context)=>BlocProvider.of(context);
  String? message;
  String? token=CacheHelper.getData(key: 'token');
  void topicDecision({
    required String result
})
  {
    DioHelper.postData(
        url: ADDRESULTTOTOPIC,
        data: {
          'councilId':GetAllMeetingCubit.get(context).councilIds,
          'topicId':topicId,
          'result':result
        },
      token: token
    ).then((value) {
      message=value.data.toString();
      emit(TopicDecisionSuccessState(message!));
    }).catchError((error){
      log('error is ${error.toString()}');
      emit(TopicDecisionErrorState(error));
    });
  }
}
import 'dart:developer';
import 'package:councils/models/getAllTopic.dart';
import 'package:councils/modules/topics/cubit/states.dart';
import 'package:councils/shared/component/constants.dart';
import 'package:councils/shared/network/end_point.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TopicCubit extends Cubit<TopicStates> {

  TopicCubit() :super(TopicInitialState());

  static TopicCubit get(context) => BlocProvider.of(context);

  bool isShowCategoryList = false;

  void showCategoryList() {
    isShowCategoryList = !isShowCategoryList;
    emit(ShowCategoryListState());
  }

  bool isDecision = false;

  void decesions() {
    isDecision = !isDecision;
    emit(ShowDecisionListState());
  }

  String isSelected = 'Priority';
  int? councilId = CacheHelper.getData(key: 'councilId');
  String? token=CacheHelper.getData(key: 'token');
 // int councilId=CacheHelper.getData(key: 'councilId');
  void SelectedItem(String item) {
    isSelected = item;
    emit(CategoryListState());
  }
  GetAllTopicModel? getAllTopicModel;
  void getAllTopics(){
    DioHelper.postData(
        url: GETALLTOPICS,
        data: {
          'councilId':councilId,
          'token':token
        },
        token: token
    ).then((value) {
      log(councilId.toString());
      getAllTopicModel=GetAllTopicModel.fromjson(value.data);
      log('message');
      log('data is ${getAllTopicModel?.values.toString()}');
      log(value.data.toString());
      emit(GetAllTopicSuccessState(getAllTopicModel!));
    }).catchError((error){
      log('error : ${error.toString()}');
      emit(GetAllTopicErrorState(error));
    });
}
///////////////////////////////////////////////////////
  GetAllTopicModel? getTopicByNameModel;
  void getTopicByName()
  {
    DioHelper.getData(
        url:GETALLTOPICBYNAME,
        token: token
    ).then((value) {
      log('success');
      log(value.data.toString());
      getTopicByNameModel=GetAllTopicModel.fromjson(value.data);
      emit(GetTopicsByNameSuccessState(getAllTopicModel!));
      //emit(GetTopicByNameSuccessState(getTopicByNameModel!));
    }).catchError((error){
      log('error : ${error.toString()}');
      emit(GetTopicsByNameErrorState(error));
    });
  }
}


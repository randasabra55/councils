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

  String isSelected = 'Name';
  int? councilId = CacheHelper.getData(key: 'councilId');
  String? token=CacheHelper.getData(key: 'token');
 // int councilId=CacheHelper.getData(key: 'councilId');
 //  void SelectedItem(String item) {
 //    isSelected = item;
 //    emit(CategoryListState());
 //  }
  GetAllTopicModel? getAllTopicModel;
  int? topicId;
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
      topicId=getAllTopicModel?.values.first.topicId;
      CacheHelper.saveData(key: 'topicId', value: topicId);

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
 // GetAllTopicModel? getTopicByNameModel;
//  GetAllTopicModel? getTopicByDateModel;
  void getTopicByName()
  {
    DioHelper.getData(
        url:GETALLTOPICBYNAME,
        token: token
    ).then((value) {
      log('success');
      log(value.data.toString());
      getAllTopicModel=GetAllTopicModel.fromjson(value.data);
      // getTopicByNameModel=GetAllTopicModel.fromjson(value.data);
      emit(GetTopicsByNameSuccessState(getAllTopicModel!));
      //emit(GetTopicByNameSuccessState(getTopicByNameModel!));
    }).catchError((error){
      log('error : ${error.toString()}');
      emit(GetTopicsByNameErrorState(error));
    });
  }

  void getTopicByDate()
  {
    DioHelper.getData(
        url:GETALLTOPICBYDATE,
        token: token
    ).then((value) {
      log('success date');
      log(value.data.toString());
      getAllTopicModel=GetAllTopicModel.fromjson(value.data);
      //  getTopicByDateModel=GetAllTopicModel.fromjson(value.data);
      emit(GetTopicsByDateSuccessState(getAllTopicModel!));
      //emit(GetTopicByNameSuccessState(getTopicByNameModel!));
    }).catchError((error){
      log('error : ${error.toString()}');
      emit(GetTopicsByDateErrorState(error));
    });
  }
//////////////////////////////////
  void SelectItem(String category) {
    isSelected = category;
    if (category == 'Date') {
      getTopicByDate();
    }else if (category == 'Name') {
      getTopicByName();
    }
    else
      {
        getAllTopics();
      }
  }
}


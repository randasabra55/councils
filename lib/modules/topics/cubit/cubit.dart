import 'package:councils/modules/topics/cubit/states.dart';
import 'package:councils/shared/network/end_point.dart';
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

  void SelectedItem(String item) {
    isSelected = item;
    emit(CategoryListState());
  }

  void getAllTopics(){
    DioHelper.getData(
        url: GETALLTOPICS,
        // query: {
        //   ''
        // }
       // token: token
    );
}
}


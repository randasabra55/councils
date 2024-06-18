import 'package:bloc/bloc.dart';
import 'package:councils/modules/topics/cubit/states.dart';
import 'package:flutter/cupertino.dart';
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
}


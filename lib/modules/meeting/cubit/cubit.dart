import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:councils/models/get_councils_model.dart';
import 'package:councils/modules/meeting/cubit/states.dart';
import 'package:councils/shared/component/constants.dart';
import 'package:councils/shared/network/end_point.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllMeetingCubit extends Cubit<GetAllMeetingStates>
{
  GetAllMeetingCubit():super(GetAllMeetingInitialState());
  static GetAllMeetingCubit get(context)=>BlocProvider.of(context);

  GetCouncilModel? getCouncilModel;
  void getCouncils()
  {
    DioHelper.getData(
        url: GETALLNEXTCOUNCIL,
        token: token
    ).then((value) {

      getCouncilModel=GetCouncilModel.fromjson(value.data);
      log('===========${getCouncilModel.toString()}');
      CacheHelper.saveData(key: 'councilId', value: getCouncilModel!.values?[councilId??0]);
      emit(GetAllMeetingSuccessState(getCouncilModel!));

    }).catchError((error){
      log(error.toString());
      emit(GetAllMeetingErrorState(error));
    });
  }

}
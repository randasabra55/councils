// import 'dart:developer';
//
// import 'package:bloc/bloc.dart';
// import 'package:councils/models/get_councils_model.dart';
// import 'package:councils/modules/meeting/cubit/states.dart';
// import 'package:councils/shared/component/constants.dart';
// import 'package:councils/shared/network/end_point.dart';
// import 'package:councils/shared/network/local/cache_helper.dart';
// import 'package:councils/shared/network/remote/dio_helper.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class GetAllMeetingCubit extends Cubit<GetAllMeetingStates>
// {
//   GetAllMeetingCubit():super(GetAllMeetingInitialState());
//   static GetAllMeetingCubit get(context)=>BlocProvider.of(context);
//
//   GetCouncilModel? getCouncilModel;
//   int? CouncilId;
//   void getCouncils()
//   {
//     DioHelper.getData(
//         url: GETALLNEXTCOUNCIL,
//         token: token
//     ).then((value) {
//       log('hhhhhh');
//       log(value.data.toString());
//       getCouncilModel=GetCouncilModel.fromjson(value.data);
//       CouncilId=getCouncilModel?.values.first.councilId ;
//       log('===========${getCouncilModel?.values}');
//       CacheHelper.saveData(key: 'councilId', value: CouncilId);
//       log('councillllllllll ${CouncilId.toString()}');
//       // CacheHelper.saveData(key: 'councilId', value: getCouncilModel?.values['$councilId']);
//     //  log('council id is $councilId');
//       //  CacheHelper.saveData(key: 'councilId', value: getCouncilModel?.values?[councilId!]);
//       emit(GetAllMeetingSuccessState(getCouncilModel!));
//
//     }).catchError((error){
//       log(error.toString());
//       emit(GetAllMeetingErrorState(error));
//     });
//   }
//
// }
//
// // import 'dart:developer';
// // import 'package:bloc/bloc.dart';
// // import 'package:councils/models/get_councils_model.dart';
// // import 'package:councils/modules/meeting/cubit/states.dart';
// // import 'package:councils/shared/component/constants.dart';
// // import 'package:councils/shared/network/end_point.dart';
// // import 'package:councils/shared/network/local/cache_helper.dart';
// // import 'package:councils/shared/network/remote/dio_helper.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// //
// // class GetAllMeetingCubit extends Cubit<GetAllMeetingStates> {
// //   GetAllMeetingCubit() : super(GetAllMeetingInitialState());
// //
// //   static GetAllMeetingCubit get(context) => BlocProvider.of(context);
// //
// //   GetCouncilModel? getCouncilModel;
// //   //FlutterModel? flutterModel;
// //
// //   void getCouncils() {
// //     emit(GetAllMeetingLoadingState());
// //     DioHelper.getData(
// //       url: GETALLNEXTCOUNCIL,
// //       token: token,
// //     ).then((value) {
// //       log('Response received');
// //       log(value.data.toString());
// //
// //       try {
// //         getCouncilModel = GetCouncilModel.fromJson(value.data);
// //         log('Parsed Data: ${getCouncilModel?.values.toString()}');
// //
// //         if (getCouncilModel != null && getCouncilModel!.values!.isNotEmpty) {
// //           CacheHelper.saveData(key: 'councilId', value: getCouncilModel!.values?[councilId!]);
// //         }
// //
// //         emit(GetAllMeetingSuccessState(getCouncilModel!));
// //       } catch (e) {
// //         log('Error during data parsing: $e');
// //         emit(GetAllMeetingErrorState(e.toString()));
// //       }
// //     }).catchError((error) {
// //       log(error.toString());
// //       emit(GetAllMeetingErrorState(error.toString()));
// //     });
// //   }
// // }

import 'dart:developer';
import 'package:councils/models/get_councils_model.dart';
import 'package:councils/modules/meeting/cubit/states.dart';
import 'package:councils/shared/component/constants.dart';
import 'package:councils/shared/network/end_point.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllMeetingCubit extends Cubit<GetAllMeetingStates> {
  GetAllMeetingCubit() : super(GetAllMeetingInitialState());
  static GetAllMeetingCubit get(context) => BlocProvider.of(context);

  GetCouncilModel? getCouncilModel;
  List<int> councilIds = [];

  void getCouncils() {
    DioHelper.getData(
      url: GETALLNEXTCOUNCIL,
      token: token,
    ).then((value) {
      log('Response received');
      log(value.data.toString());
      getCouncilModel = GetCouncilModel.fromjson(value.data);

      // الحصول على جميع معرفات المجلس وتحويلها إلى قائمة
      councilIds = getCouncilModel?.values
          .map((council) => council.councilId)
          .where((id) => id != null)
          .cast<int>()
          .toList() ?? [];

      log('=========== All Council IDs: ${councilIds.toString()}');

      // حفظ المعرفات في ذاكرة التخزين المؤقت
      CacheHelper.saveData(key: 'councilIds', value: councilIds);

      emit(GetAllMeetingSuccessState(getCouncilModel!));
    }).catchError((error) {
      log(error.toString());
      emit(GetAllMeetingErrorState(error));
    });
  }

  // وظيفة لطباعة معرف المجلس الذي تم الضغط عليه
  void printCouncilId(int councilId) {
    log('Pressed Council ID: $councilId');
  }
}
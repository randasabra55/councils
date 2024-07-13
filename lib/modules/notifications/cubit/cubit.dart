
import 'dart:developer';

import 'package:councils/models/notification_model/notification_item_model.dart';
import 'package:councils/models/notofication_model.dart';
import 'package:councils/modules/notifications/cubit/states.dart';
import 'package:councils/shared/network/end_point.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationStates> {

  NotificationCubit():super(NotificationInitialState());

  static NotificationCubit get(context) => BlocProvider.of(context);
  String? token=CacheHelper.getData(key: 'token');
  int? councilId=CacheHelper.getData(key: 'councilId');

  GetNotificationModel? getNotificationModel;
  void getNotification()
  {
    DioHelper.getData(
        url:GETNOTIFICATION,
        token: token
    ).then((value) {
      log('success');
      log(value.data.toString());
      getNotificationModel=GetNotificationModel.fromjson(value.data);
      emit(GetNotificationSuccessState(getNotificationModel!));
    }).catchError((error){
      log('error : ${error.toString()}');
      emit(GetNotificationErrorState(error));
    });
  }

  void acceptNotification({
    required bool isAttending,
    String? reason,

})
  {
    DioHelper.putData(
        url: ACCEPTNOTIFICATION,
        data: {
          'isAttending':isAttending,
          'reasonNonAttendance':reason,
          'councilId':councilId
        }
    ).then((value) {
      log(value.data.toString());
      emit(AcceptSuccessState());
    }).catchError((error){
      log('error is : ${error.toString()}');
      emit(AcceptErrorState(error));
    });
  }
//  bool isAccepted=true;
//   NotificationModel? model;
//  // bool c=model!.isAccept;
//   void accept()
//   {
//     model?.isAccept=true;
//    // isAccepted=true;
//     emit(NotificationAcceptState());
//   }
//   void reject()
//   {
//     model?.isAccept=false;
//    // isAccepted=false;
//     emit(NotificationRejectState());
//   }
//
//   bool isShowAccept=false;
//   void show(){
//     isShowAccept=!isShowAccept;
//     emit(NotificationShowAccept_RejectState());
//   }
}
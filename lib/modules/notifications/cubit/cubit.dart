import 'package:councils/modules/notifications/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationStates> {

  NotificationCubit():super(NotificationInitialState());

  static NotificationCubit get(context) => BlocProvider.of(context);

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
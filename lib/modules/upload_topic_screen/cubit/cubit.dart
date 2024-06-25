import 'package:councils/modules/upload_topic_screen/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TopicUploadCubit extends Cubit<UploadTopics> {

  TopicUploadCubit() :super(UploadInitialTopic());

  static TopicUploadCubit get(context) => BlocProvider.of(context);

  bool isUploadButton=true;
  void uploadButton()
  {
    isUploadButton=true;
    emit(ChooseUploadButtonState());
  }
  void cancelButton()
  {
    isUploadButton=false;
    emit(ChooseCancelButtonState());
  }
}

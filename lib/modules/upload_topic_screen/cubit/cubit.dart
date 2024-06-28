import 'dart:developer';

import 'package:councils/modules/upload_topic_screen/cubit/states.dart';
import 'package:councils/shared/network/end_point.dart';
import 'package:councils/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TopicUploadCubit extends Cubit<UploadTopics> {

  TopicUploadCubit() :super(UploadInitialTopic());

  static TopicUploadCubit get(context) => BlocProvider.of(context);

  bool isUploadButton = true;

  void uploadButton() {
    isUploadButton = true;
    emit(ChooseUploadButtonState());
  }

  void cancelButton() {
    isUploadButton = false;
    emit(ChooseCancelButtonState());
  }
  PlatformFile? selectedFile;
  Future<void> uploadTopicFromPhone() async {
    emit(UploadFileLoadingState());
   // emit(UploadFileLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      selectedFile = result.files.first;
      emit(UploadFileSelectedState(selectedFile!));
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
            selectedFile!.path!, filename: selectedFile!.name),
      });
    }
  }

  void resetFileSelection() {
    selectedFile = null;
    emit(UploadInitialTopic());
  }

  void uploadTopic({
    required String title,
    required String type,
    required String attachment,
    required int councilId,
})
  {
    DioHelper.postData(
        url: UPLOADTOPIC,
        data: {
          'Title':title,
          'Type':type,
          'Attachment':attachment,
          'CouncilId':councilId
        }
    ).then((value) {
      log(value.data.toString());
      emit(UploadTopicSuccessState());
    }).catchError((error){
      log(error.toString());
      emit(UploadTopicErrorState(error));
    });
  }
}



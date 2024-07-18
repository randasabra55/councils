import 'dart:developer';
import 'package:councils/modules/upload_topic_screen/cubit/states.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/end_point.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';

class TopicUploadCubit extends Cubit<UploadTopics> {

  TopicUploadCubit() :super(UploadInitialTopic());

  static TopicUploadCubit get(context) => BlocProvider.of(context);

  // bool isUploadButton = true;
  //
  // void uploadButton() {
  //   isUploadButton = true;
  //   emit(ChooseUploadButtonState());
  // }
  //
  // void cancelButton() {
  //   isUploadButton = false;
  //   emit(ChooseCancelButtonState());
  // }

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
      log(selectedFile!.path.toString());
    }else {
      emit(UploadFileErrorState('no file selected'));
    }
      // FormData formData = FormData.fromMap({
      //   'file': await MultipartFile.fromFile(
      //       selectedFile!.path!, filename: selectedFile!.name),
      // });
    }

////////////////////upload topic

//   void resetFileSelection() {
//     selectedFile = null;
//     emit(UploadInitialTopic());
//   }

  String? message;
  int? councilId=CacheHelper.getData(key: 'councilId');

  void uploadTopic({
    required String title,
    required String type,
    required int? councilId,

  }) async {
    if (selectedFile == null) {
      // Handle the case where no file is selected
      emit(UploadTopicErrorState('No file selected'));
     // return;
    }
    if (councilId == null || councilId <= 0) {
      emit(UploadTopicErrorState('Invalid CouncilId'));
      return;
    }
    emit(UploadFileLoadingState());

    ///////////////////////
    String? token = CacheHelper.getData(key: 'token'); // Retrieve the token from cache
    log('token: ${token.toString()}');
   // int councilId=CacheHelper.getData(key: 'councilId');
    log('council is ${councilId.toString()}');
    if (token == null) {
      emit(UploadTopicErrorState('No authentication token found'));
      return;
    }
    //////////////////////
    FormData formData = FormData.fromMap({
      'Title': title,
      'Type': type,
      'CouncilId': councilId,
      'Attachment': await MultipartFile.fromFile(
          selectedFile!.path!, filename: selectedFile!.name),
    });

    try {
      var response = await DioHelper.postData(
        url: UPLOADTOPIC,
        data: formData,
        token: token
      );
      log(response.data.toString());
      message = response.data.toString();
      emit(UploadTopicSuccessState(message!));
    } catch (error) {
      log('error : ${error.toString()}');
      if (error is DioException) {
        log('Error response: ${error.response?.data}');
      }
      emit(UploadTopicErrorState(error.toString()));
    }
  }
}

//   void uploadTopic({
//     required String title,
//     required String type,
//     required int councilId,
//     required PlatformFile? attachment,
// })
//   {
//     DioHelper.postData(
//         url: UPLOADTOPIC,
//         data: {
//           'Title':title,
//           'Type':type,
//           'CouncilId':councilId,
//           'Attachment':attachment
//         }
//     ).then((value) {
//       log("h");
//       log(value.data.toString());
//       message=value.data.toString();
//       emit(UploadTopicSuccessState(message!));
//     }).catchError((error){
//       log(error.toString());
//       emit(UploadTopicErrorState(error));
//     });
//   }





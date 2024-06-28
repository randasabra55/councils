import 'package:file_picker/file_picker.dart';

class UploadTopics{}

class UploadInitialTopic extends UploadTopics{}

class ChooseUploadButtonState extends UploadTopics{}

class ChooseCancelButtonState extends UploadTopics{}

class UploadFileLoadingState extends UploadTopics {}

class UploadFileSelectedState extends UploadTopics {
  final PlatformFile selectedFile;

  UploadFileSelectedState(this.selectedFile);
}

class UploadTopicSuccessState extends UploadTopics {}

class UploadTopicErrorState extends UploadTopics {
  final String error;

  UploadTopicErrorState(this.error);

}





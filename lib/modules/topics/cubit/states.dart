import 'package:councils/models/getAllTopic.dart';

class TopicStates {}

class TopicInitialState extends TopicStates{}

class ShowCategoryListState extends TopicStates{}

class CategoryListState extends TopicStates{}

class ShowDecisionListState extends TopicStates{}

class GetAllTopicSuccessState extends TopicStates{
  final GetAllTopicModel getAllTopicModel;

  GetAllTopicSuccessState(this.getAllTopicModel);

}

class GetAllTopicErrorState extends TopicStates{
  final String error;

  GetAllTopicErrorState(this.error);

}

class GetTopicsByNameSuccessState extends TopicStates{
  final GetAllTopicModel getAllTopicModel;

  GetTopicsByNameSuccessState(this.getAllTopicModel);
}

class GetTopicsByNameErrorState extends TopicStates{
  final String error;

  GetTopicsByNameErrorState(this.error);

}

class GetTopicsByDateSuccessState extends TopicStates{
  final GetAllTopicModel getAllTopicModel;

  GetTopicsByDateSuccessState(this.getAllTopicModel);
}

class GetTopicsByDateErrorState extends TopicStates{
  final String error;

  GetTopicsByDateErrorState(this.error);

}





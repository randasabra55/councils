abstract class TopicDecisionStates{}

class TopicDecisionInitialState extends TopicDecisionStates{}

class TopicDecisionSuccessState extends TopicDecisionStates{
  final String message;

  TopicDecisionSuccessState(this.message);

}

class TopicDecisionErrorState extends TopicDecisionStates{
  final String error;

  TopicDecisionErrorState(this.error);

}





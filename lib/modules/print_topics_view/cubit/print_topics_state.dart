// cubit/topics_state.dart

import 'package:councils/models/print_topics_model/print_topic_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TopicsState {}

class TopicsInitial extends TopicsState {}

class TopicsLoading extends TopicsState {}

class TopicsLoaded extends TopicsState {
  final List<PrintTopicModel> topics;

  TopicsLoaded(this.topics);
}

class TopicsError extends TopicsState {
  final String message;

  TopicsError(this.message);
}

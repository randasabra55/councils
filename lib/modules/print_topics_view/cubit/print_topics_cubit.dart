// cubit/topics_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:councils/Services/data_service.dart';
import 'package:councils/modules/print_topics_view/cubit/print_topics_state.dart';
import 'package:meta/meta.dart';


class TopicsCubit extends Cubit<TopicsState> {
  final DataService dataService;
  final int councilId;

  TopicsCubit({required this.dataService, required this.councilId}) : super(TopicsInitial());

  Future<void> fetchTopics() async {
    try {
      emit(TopicsLoading());
      final topics = await dataService.getTopicsByCouncilId(councilId);
      emit(TopicsLoaded(topics));
    } catch (e) {
      emit(TopicsError('Failed to fetch topics.'));
    }
  }
}

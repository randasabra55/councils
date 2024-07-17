import 'package:bloc/bloc.dart';
import 'package:councils/Services/data_service.dart';
import 'package:councils/modules/Search_Views/cubit/CouncilSearch_State.dart';
import 'package:meta/meta.dart';


class SearchCubit extends Cubit<SearchState> {
  final DataService dataService;

  SearchCubit(this.dataService) : super(SearchInitial());

  Future<void> searchByName(String name) async {
    emit(SearchLoading());
    try {
      final councils = await dataService.getCouncilsByName(name);
      emit(SearchLoaded(councils: councils));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }

  Future<void> searchByDate(String date) async {
    emit(SearchLoading());
    try {
      final council = await dataService.getCouncilByDate(date);
      if (council != null) {
        emit(SearchLoaded(councils: [council]));
      } else {
        emit(SearchError(message: "No data found"));
      }
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }

  Future<void> searchByDuration(String duration) async {
    emit(SearchLoading());
    try {
      final councils = await dataService.getCouncilsByDuration(duration);
      emit(SearchLoaded(councils: councils));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:councils/Services/data_service.dart';
import 'package:councils/models/hall_model/hall_model.dart';
import 'package:equatable/equatable.dart';
part 'hall_state.dart';

class HallCubit extends Cubit<HallState> {
  final DataService dataService;

  HallCubit(this.dataService) : super(HallInitial());

  Future<void> fetchHalls() async {
    try {
      emit(HallLoading());
      final halls = await dataService.getHalls();
      emit(HallLoaded(halls));
    } catch (e) {
      emit(HallError(e.toString()));
    }
  }
}

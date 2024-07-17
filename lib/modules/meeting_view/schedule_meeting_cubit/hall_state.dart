part of 'hall_cubit.dart';

abstract class HallState extends Equatable {
  const HallState();

  @override
  List<Object> get props => [];
}

class HallInitial extends HallState {}

class HallLoading extends HallState {}

class HallLoaded extends HallState {
  final List<HallModel> halls;

  const HallLoaded(this.halls);

  @override
  List<Object> get props => [halls];
}

class HallError extends HallState {
  final String message;

  const HallError(this.message);

  @override
  List<Object> get props => [message];
}

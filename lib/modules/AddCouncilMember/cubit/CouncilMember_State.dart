import 'package:councils/models/add_member_model/add_member_model.dart';
import 'package:equatable/equatable.dart';

abstract class CouncilMemberState extends Equatable {
  const CouncilMemberState();

  @override
  List<Object> get props => [];
}

class CouncilMemberInitial extends CouncilMemberState {}

class CouncilMemberLoading extends CouncilMemberState {}

class CouncilMemberLoaded extends CouncilMemberState {
  final List<AddMemberModel> users;

  const CouncilMemberLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class CouncilMemberError extends CouncilMemberState {}

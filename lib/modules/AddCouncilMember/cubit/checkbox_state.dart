
import 'package:councils/models/add_member_model/add_member_model.dart';
import 'package:equatable/equatable.dart';


class MemberState extends Equatable {
  final List<AddMemberModel> selectedMembers;
  final List<String> memberEmails;

  const MemberState({
    this.selectedMembers = const [],
    this.memberEmails = const [],
  });

  MemberState copyWith({
    List<AddMemberModel>? selectedMembers,
    List<String>? memberEmails,
  }) {
    return MemberState(
      selectedMembers: selectedMembers ?? this.selectedMembers,
      memberEmails: memberEmails ?? this.memberEmails,
    );
  }

  @override
  List<Object> get props => [selectedMembers, memberEmails];
}

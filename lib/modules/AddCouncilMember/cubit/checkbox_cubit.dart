import 'package:bloc/bloc.dart';
import 'package:councils/models/add_member_model/add_member_model.dart';
import 'package:councils/modules/AddCouncilMember/cubit/checkbox_state.dart';

class MemberCubit extends Cubit<MemberState> {
  MemberCubit() : super(const MemberState());

  void toggleMemberSelection(AddMemberModel member) {
    final selectedMembers = List<AddMemberModel>.from(state.selectedMembers);
    final memberEmails = List<String>.from(state.memberEmails);

    if (selectedMembers.contains(member)) {
      selectedMembers.remove(member);
      memberEmails.remove(member.email);
    } else {
      selectedMembers.add(member);
      memberEmails.add(member.email);
    }

    emit(state.copyWith(
      selectedMembers: selectedMembers,
      memberEmails: memberEmails,
    ));
  }
}

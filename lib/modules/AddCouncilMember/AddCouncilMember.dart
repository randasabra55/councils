import 'package:councils/Services/data_service.dart';
import 'package:councils/Widgets/components/app_bar_custom.dart';
import 'package:councils/models/add_member_model/add_member_model.dart';
import 'package:councils/models/council_model/council_model.dart';
import 'package:councils/models/custom_icon_model/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCouncilMember extends StatefulWidget {
  final CreateCouncilReturnModel createCouncilReturnModel;
  final DataService dataService;

  const AddCouncilMember(
      {required this.createCouncilReturnModel,
      required this.dataService,
      super.key});

  @override
  State<AddCouncilMember> createState() => _AddCouncilMemberState();
}

class _AddCouncilMemberState extends State<AddCouncilMember> {
  List<AddMemberModel> selectedMembers = [];
  List<String> memberEmails = [];
  List<AddMemberModel> searchResults = [];
  bool isLoading = false;

  void _showMemberDrawer() async {
    setState(() {
      isLoading = true;
    });

    List<AddMemberModel> members = await widget.dataService
        .getCouncilMembersByType(widget.createCouncilReturnModel.typeCouncilId);

    setState(() {
      isLoading = false;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Padding(
                padding: EdgeInsets.all(20.h),
                child: Container(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          controller: scrollController,
                          itemCount: members.length,
                          itemBuilder: (context, index) {
                            final member = members[index];
                            final isSelected = selectedMembers.any(
                                (selectedMember) =>
                                    selectedMember.email == member.email);

                            return Container(
                              color: isSelected
                                  ? Colors.blue.withOpacity(0.5)
                                  : Colors.transparent,
                              child: CheckboxListTile(
                                title: Text(member.fullName),
                                subtitle: Text(member.email),
                                value: isSelected,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      if (value == true) {
                                        selectedMembers.add(member);
                                        memberEmails.add(member.email);
                                      } else {
                                        selectedMembers.removeWhere(
                                            (selectedMember) =>
                                                selectedMember.email ==
                                                member.email);
                                        memberEmails.remove(member.email);
                                      }
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ));
          },
        );
      },
    );
  }

  void _searchMembers(String query) async {
    setState(() {
      isLoading = true;
    });

    List<AddMemberModel> results =
        await widget.dataService.getUsersByName(query);

    setState(() {
      searchResults = results;
      isLoading = false;
    });
  }

  void _inviteMembers() async {
    final councilId = widget.createCouncilReturnModel.id;

    final response = await widget.dataService.dio.post(
      '${widget.dataService.domain}CouncilMember/AddCouncilMember',
      data: {
        'councilId': councilId,
        'emailUsers': memberEmails,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Members invited successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to invite members. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
          pageName: 'Invite Members', fontSize: 22, context: context),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: _searchMembers,
                    decoration: InputDecoration(
                      labelText: 'Search Members',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding: EdgeInsets.only(left: 8.w),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.string(
                            CustomIcon().search,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                IconButton(
                  onPressed: _showMemberDrawer,
                  icon: SizedBox(
                    height: 30.h,
                    width: 30.w,
                    child: SvgPicture.string(
                      CustomIcon().members,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: searchResults.map((user) {
                return ListTile(
                  title: Text(user.fullName),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: Icon(
                      selectedMembers.contains(user) ? Icons.remove : Icons.add,
                      color: selectedMembers.contains(user)
                          ? Colors.red
                          : Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedMembers.contains(user)) {
                          selectedMembers.remove(user);
                          memberEmails.remove(user.email);
                        } else {
                          selectedMembers.add(user);
                          memberEmails.add(user.email);
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: SizedBox(
          height: 60.h,
          child: FloatingActionButton.extended(
            onPressed: _inviteMembers,
            label: Text(
              'INVITE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
            backgroundColor: const Color(0xff5669FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

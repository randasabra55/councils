import 'dart:developer';

import 'package:councils/Services/data_service.dart';
import 'package:councils/Widgets/components/app_bar_custom.dart';
import 'package:councils/models/council_model/council_model.dart';
import 'package:councils/models/custom_icon_model/custom_icon.dart';
import 'package:councils/models/hall_model/hall_model.dart';
import 'package:councils/modules/AddCouncilMember/AddCouncilMember.dart';
import 'package:councils/shared/component/constants.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScheduleMeeting extends StatefulWidget {
  const ScheduleMeeting({super.key});

  @override
  State<ScheduleMeeting> createState() => _ScheduleMeetingState();
}

class _ScheduleMeetingState extends State<ScheduleMeeting> {
  final String pageName = 'Schedule Meeting';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _timeDateController = TextEditingController();
  final DataService _dataService = DataService(authToken: CacheHelper.getData(key: 'token'));
  List<HallModel> _halls = [];
  HallModel? _selectedHall;
  CreateCouncilReturnModel? _createCouncilReturnModel;

  @override
  void initState() {
    super.initState();
    _fetchHalls();
  }

  Future<void> _fetchHalls() async {
    List<HallModel> halls = await _dataService.getHalls();
    setState(() {
      _halls = halls;
    });
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          _timeDateController.text =
              '${pickedDate.toLocal()} ${pickedTime.format(context)}'
                  .split(' ')[0];
          log(_timeDateController.toString());
        });
      }
    }
  }

//   Future<void> _selectDateTime(BuildContext context) async {
//   final DateTime? pickedDate = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime.now(),
//     lastDate: DateTime(2101),
//   );
//   if (pickedDate != null) {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (pickedTime != null) {
//       final DateTime combinedDateTime = DateTime(
//         pickedDate.year,
//         pickedDate.month,
//         pickedDate.day,
//         pickedTime.hour,
//         pickedTime.minute,
//       );
//       final String formattedDateTime = combinedDateTime.toIso8601String();
//       setState(() {
//         _timeDateController.text = formattedDateTime;
//         log(_timeDateController.text);
//       });
//     }
//   }
// }

  @override
  void dispose() {
    _titleController.dispose();
    _timeDateController.dispose();
    super.dispose();
  }

  Future<void> _createCouncil() async {
    if (_formKey.currentState!.validate()) {
      final council = CouncilCreationModel(
        title: _titleController.text,
        timeAndDate: _timeDateController.text,
        location: _selectedHall?.id ?? 0,
      );
      _createCouncilReturnModel = await _dataService.createCouncil(council);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddCouncilMember(
            createCouncilReturnModel: _createCouncilReturnModel!,
            dataService: _dataService,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: appBarCustom(pageName: pageName, fontSize: 22, context: context),
      body: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 2.h),
              Text(
                'Name of meeting',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Title of meeting',
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.85),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.string(
                        CustomIcon().titleofMeeting,
                        width: 20.w,
                        height: 20.h,
                      )),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title of the meeting';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.h),
              Text(
                'Time & Date',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: _timeDateController,
                readOnly: true,
                onTap: () => _selectDateTime(context),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Select time and date',
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.85),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.string(
                      CustomIcon().timeAndDate,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 5.h,
                      width: 5.w,
                      child: SvgPicture.string(
                        CustomIcon().arrowDown,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select the time and date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.h),
              Text(
                'Location',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 20.h),
              DropdownButtonFormField<HallModel>(
                icon: Container(
                  height: 20.h,
                  width: 20.w,
                  child: SvgPicture.string(
                    CustomIcon().arrowDown,
                  ),
                ),
                value: _selectedHall,
                items: _halls.map((hall) {
                  return DropdownMenuItem<HallModel>(
                    value: hall,
                    child: Text(hall.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedHall = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Select location',
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.85),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.string(
                      CustomIcon().location,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 200.h),
              Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.grey.shade300),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.w),
                      ),
                      textStyle: WidgetStatePropertyAll(
                        TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'CANCEL',
                    ),
                  ),
                  SizedBox(width: 20.w),
                  TextButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 55.w, vertical: 20.w),
                      ),
                      textStyle: WidgetStatePropertyAll(
                        TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(
                        Color(0xff5669FF),
                      ),
                    ),
                    onPressed: _createCouncil,
                    child: const Text(
                      'CREATE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:councils/layouts/home_layout/cubit/cubit.dart';
import 'package:councils/layouts/home_layout/cubit/states.dart';
import 'package:councils/modules/schedule_meeting_view/schedule_meeting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (BuildContext context, HomeLayoutStates state) {},
        builder: (BuildContext context, HomeLayoutStates state) {
          HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 30,
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.clickButtonNavigation(value);
              },
              selectedItemColor: Color(0xff4A43EC),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}

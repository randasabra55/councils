import 'package:councils/layouts/home_layout/cubit/cubit.dart';
import 'package:councils/layouts/home_layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/meeting_view/schedule_meeting.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});


 // int index=0;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
        listener: (BuildContext context, HomeLayoutStates state) {  },
        builder: (BuildContext context, HomeLayoutStates state) {
          HomeLayoutCubit cubit=HomeLayoutCubit.get(context);
          return Scaffold(
           // appBar: AppBar(),
            bottomNavigationBar: BottomNavigationBar(
            //  elevation: 10,
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (value){
                cubit.clickButtonNavigation(value);
              },
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const ScheduleMeeting(),
                  ),
                );
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add,),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },

      ),
    );
  }
}/////////

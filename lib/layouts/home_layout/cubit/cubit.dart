import 'package:councils/layouts/home_layout/cubit/states.dart';

import 'package:councils/modules/meeting/meeting_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/chair_man_profile/chair_man_profile.dart';
import '../../../modules/home/home_view.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates>{

  HomeLayoutCubit():super(InitialState());
  static HomeLayoutCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<BottomNavigationBarItem>items=[
    const BottomNavigationBarItem(
        icon: Icon(Icons.home,),
        label: 'Home'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_rounded),
        label: 'Meetings'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile'
    )
  ];
  List<Widget>screens=[
     HomeView(),
     MeetingScreen(),
     SearchView(),
    ChairManProfile(),
  ];
  void clickButtonNavigation(int index)
  {
    currentIndex=index;
    emit(ButtonNavigationState());
  }


}
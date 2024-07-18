import 'package:councils/models/custom_icon_model/custom_icon.dart';
import 'package:councils/modules/Search_Views/search_council_view.dart';
import 'package:councils/modules/chair_man_profile/chair_man_profile.dart';
import 'package:councils/modules/home/home_view.dart';
import 'package:councils/modules/meeting/no_meeting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:councils/layouts/home_layout/cubit/states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(InitialState());

  static HomeLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: SvgPicture.string(
        CustomIcon().nv[0]['ico'],
      ),
      activeIcon: SvgPicture.string(
        CustomIcon().nv[0]['icoSelect'],
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.string(
        CustomIcon().nv[1]['ico'],
      ),
      activeIcon: SvgPicture.string(
        CustomIcon().nv[1]['icoSelect'],
      ),
      label: 'Meetings',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.string(
        CustomIcon().nv[2]['ico'],
      ),
      activeIcon: SvgPicture.string(
        CustomIcon().nv[2]['icoSelect'],
      ),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.string(
        CustomIcon().nv[3]['ico'],
      ),
      activeIcon: SvgPicture.string(
        CustomIcon().nv[3]['icoSelect'],
      ),
      label: 'Profile',
    ),
  ];

  final List<Widget> screens = [
    HomeView(),
    NoMeetingView(),
    SearchView(),
    ChairManProfile(),
  ];

  void clickButtonNavigation(int index) {
    currentIndex = index;
    emit(ButtonNavigationState());
  }
}

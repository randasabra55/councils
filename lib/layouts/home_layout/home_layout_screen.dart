import 'package:councils/layouts/home_layout/cubit/cubit.dart';
import 'package:councils/layouts/home_layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutScreen extends StatelessWidget {

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
            body: cubit.screens[cubit.currentIndex],
          );
        },

      ),
    );
  }
}

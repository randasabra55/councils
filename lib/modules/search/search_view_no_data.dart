import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/components/app_bar_custom.dart';
import '../../Widgets/components/home_component/custom_navigation_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String pageName = 'Search';
  List topics = ['مالي', "شئون ", "شئون خريجين", "شئون عاملين"];
  String topicVal = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: appBarCustom(pageName: pageName, fontSize: 25),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                disabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.arrow_back_ios_new),
                filled: true,
              ),
            ),
          ),
          SizedBox(
            width: 360.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                DropdownMenu(
                  inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: Color(0xff9747FF),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  dropdownMenuEntries: [],
                  hintText: 'Topic',
                  trailingIcon: Icon(Icons.keyboard_arrow_down),
                )
              ],
            ),
          )
        ],
      ),
      // bottomNavigationBar: const CustomNavigationBar(
      //   selectedIndex: 2,
      // ),
    );
  }
}

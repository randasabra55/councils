import 'package:flutter/material.dart';

import '../Widgets/components/home_component/custom_navigation_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("profile")),
      // bottomNavigationBar: const CustomNavigationBar(
      //   selectedIndex: 3,
      // ),
    );
  }
}

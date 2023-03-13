import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/navigation_drawer.dart';
import 'package:let_tutor_mobile/app/modules/profile/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
          context: context, title: "Profile"),
      drawer: createNavigationDrawer(),
      body: const Center(
        child: Text("Profile View"),
      ),
    );
  }
}

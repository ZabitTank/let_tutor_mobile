import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/teacher.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/navigation_drawer.dart';
import 'package:let_tutor_mobile/app/modules/tutor/tutor_controller.dart';
import 'package:let_tutor_mobile/app/modules/tutor/widgets/teacher_section.dart';
import 'package:let_tutor_mobile/app/modules/tutor/widgets/video_section.dart';

class TutorView extends GetView<TutorController> {
  const TutorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
          context: context, title: "Tutor Detail"),
      drawer: createNavigationDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: VideoSection(
                    linkVideo:
                        "https://api.app.lettutor.com/video/4d54d3d7-d2a9-42e5-97a2-5ed38af5789avideo1627913015871.mp4",
                  ),
                ),
                TeacherSection(
                  teacher: controller.teacherInfo,
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

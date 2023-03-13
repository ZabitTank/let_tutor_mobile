import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_controller.dart';

class SchedulesView extends GetView<SchedulesController> {
  const SchedulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Schedule"),
    );
  }
}

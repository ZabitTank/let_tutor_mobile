import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/settings/settings_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}

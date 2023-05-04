import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/app/modules/home/home_controller.dart';
import 'package:let_tutor_mobile/core/utils/secure_storage.dart';

class SettingsController extends GetxController {
  final appStateController = Get.find<AppStateController>();
  final homeController = Get.find<HomeController>();
  late RxBool isAutoRead;
  late RxBool isDarkMode;

  final isLoading = true.obs;
  TextEditingController apiKeyController = TextEditingController();

  Future<void> changeAPIKey() async {
    String? initKey = await SecureStorage.getIdToken();
    String? newApiKey =
        await showKeyDialog(controller: apiKeyController, apikey: initKey);
    await appStateController.handleUseAPIKey(newApiKey);
  }

  Future<void> changeTheme(bool value) async {
    isDarkMode.value = value;
    await appStateController.changeTheme(isDarkMode.value);
  }

  Future<void> toggleAutoRead(bool value) async {
    isAutoRead.value = value;
    await appStateController.toggleAutoRead(isAutoRead.value);
  }

  @override
  void onClose() {
    apiKeyController.dispose();
    isDarkMode.close();
    isLoading.close();
    isAutoRead.close();
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    isDarkMode = RxBool(appStateController.appSettings.isDark);
    isAutoRead = RxBool(appStateController.appSettings.isAutoRead);
    apiKeyController.text = await SecureStorage.getIdToken() ?? "";
    isLoading.value = false;
  }
}

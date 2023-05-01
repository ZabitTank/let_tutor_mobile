import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/core/utils/field_validation.dart';

class ChangePasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    isLoading.close();
    super.onClose();
  }

  Future<void> validateAndSave() async {
    if (!await FieldValidator.validateField(formKey)) {
      return;
    }

    try {
      LetTutorAPIService.authenAPIService.changePassword(
          newPassword: newPasswordController.text,
          oldPassword: oldPasswordController.text);
      showSnackBar("Success", "Change Password Success");
    } catch (e) {
      showSnackBar("Failed", e.toString());
      // await lifeCycleController.logout();
    } finally {
      isLoading.value = false;
    }
  }

  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    } else if (value.length < 6) {
      return "The password length must be greater than 6 digits";
    }
    return null;
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/core/utils/field_validation.dart';
import 'package:let_tutor_mobile/core/values/exceptions/bussiness_exception.dart';
import 'package:let_tutor_mobile/routes/app_routes.dart';

class LoginController extends GetxController {
  final appstate = Get.find<AppStateController>();

  final GlobalKey<FormState> formKey = GlobalKey();
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final isUsingPhone = false.obs;
  final isSignup = false.obs;

  late final TextEditingController emailController;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final tempEmailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    tempEmailController.dispose();

    isLoading.close();
    errorMessage.close();
    isUsingPhone.close();
    isSignup.close();
    super.onClose();
  }

  Future<void> mainButtonAction() async {
    if (!await FieldValidator.validateField(formKey)) {
      return;
    }
    try {
      isLoading.value = true;
      if (isSignup.value) {
        await LetTutorAPIService.authenAPIService.register(
            email: emailController.text,
            password: passwordController.text,
            isUsingPhone: isUsingPhone.value,
            phone: phoneController.text);
      } else {
        final result = await LetTutorAPIService.authenAPIService.login(
            email: emailController.text,
            password: passwordController.text,
            isUsingPhone: isUsingPhone.value,
            phone: phoneController.text);
        appstate.setUser = result.user;
      }
      showSnackBar("Sucess", "Login Sucess");

      Get.offNamed(Routes.home);
    } on IBussinessException catch (e) {
      showSnackBar("Failed", e.toString());
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    // handle google login
    try {
      isLoading.value = true;
      final loginData =
          await LetTutorAPIService.authenAPIService.loginByGoogle();

      appstate.setUser = loginData.user;
      Get.offAllNamed(Routes.home);
    } on CancelActionException catch (_) {
      isLoading.value = false;
      return;
    } catch (e) {
      showSnackBar("Failed to Signin", "");
      return;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> forgotPassword() async {
    String? email = await openEmailInputFormBottomSheet(tempEmailController);
    if (email != null) {}
  }

  void toggleUsingPhone() {
    isUsingPhone.value = !isUsingPhone.value;
  }

  void toggleSignup() {
    debugPrint("Change Mode");
    isSignup.value = !isSignup.value;
  }
}

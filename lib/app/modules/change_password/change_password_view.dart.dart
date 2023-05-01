import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

import 'change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const h_10 = SizedBox(
      height: 10,
    );
    const h_20 = SizedBox(
      height: 20,
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Change Password",
            style: BaseTextStyle.heading2(fontSize: 20),
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    "Please fill required fields below to change password",
                    style: BaseTextStyle.heading2(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Please fill your old password",
                    style: BaseTextStyle.heading2(fontSize: 16),
                  ),
                  h_10,
                  TextFormField(
                    controller: controller.oldPasswordController,
                    validator: (value) => controller.passwordValidator(value!),
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Enter your old password'),
                  ),
                  h_10,
                  Text(
                    "Please fill your new password",
                    style: BaseTextStyle.heading2(fontSize: 16),
                  ),
                  h_10,
                  TextFormField(
                    controller: controller.newPasswordController,
                    validator: (value) => controller.passwordValidator(value!),
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Enter your new password'),
                  ),
                  h_20,
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ElevatedButton(
            onPressed: () async {
              await controller.validateAndSave();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Save"),
                )),
          ),
        ),
      ),
    );
  }
}

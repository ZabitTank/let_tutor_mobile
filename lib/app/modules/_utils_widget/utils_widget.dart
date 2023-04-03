import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/utils/field_validation.dart';

void showSnackBar(String title, String message, {int second = 3}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: BaseColor.blue,
    isDismissible: true,
    duration: Duration(seconds: second),
  );
}

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double height) {
  return SizedBox(
    width: height,
  );
}

const sw_10 = SizedBox(
  width: 10,
);
const sw_20 = SizedBox(
  width: 20,
);
const sh_10 = SizedBox(
  height: 10,
);
const sh_20 = SizedBox(
  height: 20,
);

Future<String?> onpenInputFormBottomSheet() async {
  final GlobalKey<FormState> phoneFormKeyBottomSheet = GlobalKey<FormState>();
  String? errorText;
  TextEditingController phoneNumberBottomSheetController =
      TextEditingController();
  var form = Form(
    key: phoneFormKeyBottomSheet,
    child: TextFormField(
      controller: phoneNumberBottomSheetController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) => FieldValidator.phoneNumberValidator(value!),
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          errorText: errorText,
          hintText: 'Enter phone number',
          hintStyle: BaseTextStyle.body3(),
          suffixIcon: const Icon(Icons.phone_android)),
    ),
  );
  String? phone = await Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      height: Get.height * 0.2,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SizedBox(
        width: Get.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: form,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (await FieldValidator.validateField(
                      phoneFormKeyBottomSheet)) {
                    Get.back(
                      result: phoneNumberBottomSheetController.text,
                    );
                  }
                },
                child: const Text("OK"))
          ],
        ),
      ),
    ),
  );
  phoneNumberBottomSheetController.dispose();
  return phone;
}

Future<String?> openEmailInputFormBottomSheet(
    TextEditingController emailController) async {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  String? errorText;

  String? email = await Get.bottomSheet(
    GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: Get.height * 0.2,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SizedBox(
          width: Get.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Form(
                  key: emailFormKey,
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) => FieldValidator.emailValidator(value!),
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        errorText: errorText,
                        hintText: 'Enter your Email',
                        hintStyle: BaseTextStyle.body3(),
                        suffixIcon: const Icon(Icons.email)),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (await FieldValidator.validateField(emailFormKey)) {
                      Get.back(
                        result: emailController.text,
                      );
                    }
                  },
                  child: const Text("Send"))
            ],
          ),
        ),
      ),
    ),
  );
  return email;
}

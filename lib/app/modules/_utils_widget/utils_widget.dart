import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String title, String message, {int second = 3}) {
  Get.snackbar(
    title,
    message,
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

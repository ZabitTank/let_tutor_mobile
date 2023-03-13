import 'package:flutter/material.dart';

class Helper {
  static double getSize(BuildContext context, double percent,
      {bool isHeight = false}) {
    final size = isHeight
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;
    return size * percent / 100.0;
  }
}

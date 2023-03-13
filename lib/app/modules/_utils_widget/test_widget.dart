import 'package:flutter/material.dart';

class TestWidget {
  static Widget emptyCircleContainer({required double size, Color? color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }

  static Widget emptySquareContainer({required double size, Color? color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? Colors.black,
        shape: BoxShape.rectangle,
      ),
    );
  }

  static Widget emptyRetangleContainer(
      {required double width, required double height, Color? color}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.black,
        shape: BoxShape.rectangle,
      ),
    );
  }
}

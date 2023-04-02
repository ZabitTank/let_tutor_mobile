import 'package:flutter/material.dart';

class ValidInputField extends StatelessWidget {
  const ValidInputField(
      {super.key,
      required this.validator,
      required this.inputDecoration,
      required this.controller,
      this.textInputType,
      this.isHide});

  final bool? isHide;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final InputDecoration inputDecoration;
  final String? Function(String value) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: isHide ?? false,
      controller: controller,
      validator: (value) => validator.call(value!),
      onSaved: (value) {},
      decoration: inputDecoration,
    );
  }
}

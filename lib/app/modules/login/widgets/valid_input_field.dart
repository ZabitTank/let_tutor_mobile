import 'package:flutter/material.dart';

class ValidInputField extends StatefulWidget {
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
  State<ValidInputField> createState() => _ValidInputFieldState();
}

class _ValidInputFieldState extends State<ValidInputField> {
  String error = '';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType ?? TextInputType.text,
      obscureText: widget.isHide ?? false,
      controller: widget.controller,
      validator: (value) => widget.validator.call(value!),
      onSaved: (value) {},
      decoration: widget.inputDecoration,
    );
  }
}

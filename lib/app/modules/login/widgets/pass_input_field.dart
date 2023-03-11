import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/modules/login/widgets/valid_input_field.dart';
import 'package:let_tutor_mobile/core/utils/field_validation.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key, required this.controller, this.error});
  final TextEditingController controller;
  final String? error;
  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  var _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return ValidInputField(
      validator: FieldValidator.passwordFieldValidation,
      isHide: !_passwordVisible,
      controller: widget.controller,
      inputDecoration: InputDecoration(
          hintText: 'Enter your password',
          errorText: widget.error,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          )),
    );
  }
}

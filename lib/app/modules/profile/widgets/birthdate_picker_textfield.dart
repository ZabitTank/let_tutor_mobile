import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';

class BirthdatePickerTextField extends StatefulWidget {
  const BirthdatePickerTextField(
      {super.key, required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  BirthdatePickerTextFieldState createState() =>
      BirthdatePickerTextFieldState();
}

class BirthdatePickerTextFieldState extends State<BirthdatePickerTextField> {
  DateTime? _selectedDate;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.textEditingController.text =
            DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
      decoration: InputDecoration(
          labelText: 'Birthdate',
          icon: const Icon(Icons.date_range),
          labelStyle: context.labelMedium),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class CustomWidgets {
  static Widget buttonRectWithIcon(title, color, icon, {Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }

  static Widget iconButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            size: 30,
            color: iconColor,
          )), //
    );
  }
}

class IconWithTitleTile extends StatelessWidget {
  const IconWithTitleTile(
      {super.key, required this.title, required this.icon, this.gap});

  final Text title;
  final Image icon;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        title,
      ],
    );
  }
}

class ChipInfo extends StatelessWidget {
  const ChipInfo({
    super.key,
    required this.themeData,
    required this.info,
  });

  final ThemeData themeData;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.0),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 140, 157, 172),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(info, style: themeData.textTheme.bodyMedium),
    );
  }
}

Widget titleAndText(
    {required String title,
    required String hint,
    required TextTheme textTheme,
    TextEditingController? controller,
    bool? enable,
    String? Function(String?)? validator}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: BaseTextStyle.heading1(fontSize: 14),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        controller: controller,
        validator: (value) => validator != null ? validator(value) : null,
        onSaved: (value) {},
        inputFormatters: const [],
        enabled: enable ?? true,
        decoration: InputDecoration(hintText: hint),
      ),
    ],
  );
}

class SingleChoiceTextField extends StatefulWidget {
  const SingleChoiceTextField(
      {super.key,
      required this.selectedOption,
      required this.options,
      required this.title});
  final RxString selectedOption;
  final String title;
  final List<String> options;

  @override
  SingleChoiceTextFieldState createState() => SingleChoiceTextFieldState();
}

class SingleChoiceTextFieldState extends State<SingleChoiceTextField> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        DropdownButtonFormField<String>(
          value: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
              widget.selectedOption.value = value!;
            });
          },
          items: widget.options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
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

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                },
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: context.bodyMedium?.color ?? BaseColor.black,
              width: 0.05,
            ),
          ),
          child: IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: const Icon(Icons.search),
          ),
        )
      ],
    );
  }
}

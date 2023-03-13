import 'package:flutter/material.dart';

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
  final ImageIcon icon;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: title,
      horizontalTitleGap: gap ?? 5,
    );
  }
}

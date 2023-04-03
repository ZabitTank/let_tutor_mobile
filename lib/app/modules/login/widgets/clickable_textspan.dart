import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class ClickableTextSpan extends StatelessWidget {
  const ClickableTextSpan({
    super.key,
    required this.callback,
    required this.text,
    required this.highlightText,
  });
  final String text;
  final String highlightText;

  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't Have Account? ",
        style: context.bodyMedium,
        children: <TextSpan>[
          TextSpan(
            text: 'Register Now',
            style: BaseTextStyle.body2(color: Theme.of(context).primaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                callback.call();
              },
          ),
        ],
      ),
    );
  }
}

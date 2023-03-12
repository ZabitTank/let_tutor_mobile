
import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {},
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: BaseColor.black,
              width: 0.05,
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        )
      ],
    );
  }
}

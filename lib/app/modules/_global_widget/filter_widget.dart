import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class DropdownSortFilter extends StatefulWidget {
  const DropdownSortFilter(
      {super.key,
      required this.selectedItem,
      required this.items,
      required this.onSelect});

  final RxString selectedItem;
  final List<String> items;
  final void Function()? onSelect;

  @override
  State<DropdownSortFilter> createState() => _DropdownSortFilterState();
}

class _DropdownSortFilterState extends State<DropdownSortFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: widget.selectedItem.value,
          items: widget.items
              .map((String value) => DropdownMenuItem(
                    value: value,
                    child: Text(value, style: context.labelMedium),
                  ))
              .toList(),
          onChanged: (value) async {
            setState(() {
              widget.selectedItem.value = value!;
              widget.onSelect?.call();
            });
          },
        ),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    this.onFilter,
  });
  final TextEditingController controller;
  final void Function()? onFilter;

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
              onFilter?.call();
            },
            icon: const Icon(Icons.search),
          ),
        )
      ],
    );
  }
}

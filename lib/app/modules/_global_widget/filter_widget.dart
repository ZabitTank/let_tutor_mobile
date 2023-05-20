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
          onChanged: (value) {
            widget.selectedItem.value = value!;
            widget.onSelect?.call();
          },
        ),
      ],
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.controller,
    this.onFilter,
    this.hint,
    this.showIcon = true,
  });
  final TextEditingController controller;
  final void Function()? onFilter;
  final String? hint;
  final bool showIcon;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            autofocus: false,
            controller: widget.controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  widget.controller.clear();
                },
              ),
              hintText: widget.hint ?? "",
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        widget.showIcon
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: context.bodyMedium?.color ?? BaseColor.black,
                    width: 0.05,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    widget.onFilter?.call();
                  },
                  icon: const Icon(Icons.search),
                ),
              )
            : Container(),
      ],
    );
  }
}

class DateFilterUtils {
  static Future<void> chooseDate(Rx<DateTime?> time, String title,
      {bool Function(DateTime)? predicate}) async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: time.value ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: title,
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: predicate);
    if (pickedDate == null) {
      return;
    }
    if (pickedDate != time.value) {
      time.value = pickedDate;
      return;
    }
  }

  static Future<void> chooseTime(
      BuildContext context, Rx<TimeOfDay?> time, String title,
      {bool Function(DateTime)? predicate}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: title,
    );

    if (pickedTime != null) {
      // Perform time filter action with pickedTime
      time.value = pickedTime;
    }
  }

  static bool disablePastDate(DateTime day) {
    if (day.isAfter(DateTime.now().subtract(const Duration(days: 1)))) {
      return true;
    }
    return false;
  }
}

class ActionChoiceChip extends StatelessWidget {
  const ActionChoiceChip({
    Key? key,
    required this.options,
    required this.selectedOption,
    required this.title,
  }) : super(key: key);

  final List<String> options;
  final Rx<String?> selectedOption;
  final String title;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: textTheme.labelMedium),
        const SizedBox(height: 10.0),
        Wrap(
          spacing: 5.0,
          children: List<Widget>.generate(
            options.length,
            (int index) {
              return Obx(
                () => ChoiceChip(
                  label: Text(options[index]),
                  selected: selectedOption.value == options[index],
                  onSelected: (bool selected) {
                    if (selected) {
                      selectedOption.value = options[index];
                    } else {
                      selectedOption.value = null;
                    }
                  },
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}

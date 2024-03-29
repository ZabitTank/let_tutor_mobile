import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryTextFormField extends StatelessWidget {
  const CountryTextFormField({
    Key? key,
    required this.controller,
    required this.stringRef,
  }) : super(key: key);
  final TextEditingController controller;
  final Rx<String?> stringRef;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          readOnly: true,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: ("Enter your country"),
            suffixIcon: Icon(Icons.arrow_drop_down),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return ('Please enter some text');
            }
            return null;
          },
          onSaved: (val) {},
          onTap: () {
            showCountryPicker(
              context: context,

              //Optional. Shows phone code before the country name.
              showPhoneCode: false,
              onSelect: (Country country) {
                controller.text = country.name;
                stringRef.value = country.countryCode.toUpperCase();
              },
              // Optional. Sets the theme for the country list picker.
              countryListTheme: CountryListThemeData(
                // Optional. Sets the border radius for the bottomsheet.
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                // Optional. Styles the search field.
                inputDecoration: InputDecoration(
                  labelText: ('Search'),
                  hintText: ('Start typing to search'),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

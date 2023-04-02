import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_widget.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/navigation_drawer.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/profile/profile_controller.dart';
import 'package:let_tutor_mobile/app/modules/profile/widgets/avatar_circle.dart';
import 'package:let_tutor_mobile/app/modules/profile/widgets/birthdate_picker_textfield.dart';
import 'package:let_tutor_mobile/app/modules/profile/widgets/country_textformfield.dart';
import 'package:let_tutor_mobile/app/modules/profile/widgets/custom_modal_sheet.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/utils/field_validation.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    var multiFilterLearns = MultiSelectDialogField(
      selectedItemsTextStyle: themeData.textTheme.labelMedium,
      items: testPrepareations.map((e) => MultiSelectItem(e, e)).toList(),
      onConfirm: (values) async {
        controller.selectLevelOptionList = values;
      },
    );

    return Scaffold(
      appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
          context: context, title: "Profile"),
      drawer: createNavigationDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 90,
                        width: 90,
                        child: CircleAvatar(
                          child: controller.uploadImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Image.file(
                                    controller.uploadImage as File,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const AvatarCircle(
                                  width: 200,
                                  height: 200,
                                  source: "assets/icons/profile_icon.png"),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            CustomModalSheet.buildChoosePhotoBottom(
                              context: context,
                              onTappedCamera: () {
                                controller.takePhoto(ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                              onTappedGallery: () {
                                controller.takePhoto(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 15,
                            child: SvgPicture.asset(
                              "assets/icons/ic_camera.svg",
                              colorFilter: ColorFilter.mode(
                                  Colors.grey[700]!, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Account Info",
                  style: BaseTextStyle.heading2(fontSize: 16),
                ),
                sh_20,
                titleAndText(
                    title: "Name",
                    hint: "e.g. Adit Brahmana",
                    textTheme: themeData.textTheme,
                    controller: controller.nameController,
                    validator: (value) => FieldValidator.nameValidator(value!)),
                sh_20,
                titleAndText(
                  title: "Email Address",
                  initialValue: controller.appState.user.email,

                  // Nếu không cho sửa phone thì thay hint value thành driver.phone và thêm thuộc tính enable = false
                  hint: "Enter your Identity number",
                  textTheme: themeData.textTheme,
                  enable: false,
                ),
                sh_20,
                Text(
                  "Country",
                  style: BaseTextStyle.heading1(fontSize: 14),
                ),
                CountryTextFormField(
                  controller: controller.countryConller,
                  user: controller.appState.user,
                ),
                sh_20,
                titleAndText(
                  title: "Phone Number",
                  initialValue: controller.appState.user.phone,
                  hint: "Enter your Identity number",
                  textTheme: themeData.textTheme,
                  enable: false,
                ),
                sh_20,
                Text(
                  "Birthdate",
                  style: BaseTextStyle.heading1(fontSize: 14),
                ),
                BirthdatePickerTextField(
                  textEditingController: controller.birthDate,
                ),
                sh_20,
                Text(
                  "My Level",
                  style: BaseTextStyle.heading1(fontSize: 14),
                ),
                SingleChoiceTextField(
                  options: const ["bal bal", "basdasa"],
                  selectedOption: controller.selectedOption,
                  title: "My Level",
                ),
                sh_20,
                Text(
                  "Want to learn",
                  style: BaseTextStyle.heading1(fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    multiFilterLearns,
                    multiFilterLearns,
                  ],
                ),
                titleAndText(
                  title: "Study Schedule",
                  textTheme: themeData.textTheme,
                  hint: 'type whatever',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ElevatedButton(
          onPressed: () async {
            await controller.validateAndSave();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Obx(() => Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("Save"),
              )),
        ),
      ),
    );
  }

  Widget titleAndText(
      {required String title,
      required String hint,
      required TextTheme textTheme,
      TextEditingController? controller,
      bool? enable,
      String? initialValue,
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
          initialValue: initialValue,
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
}

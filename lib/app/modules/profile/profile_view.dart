import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';
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

    return Scaffold(
      appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
          context: context, title: "Profile"),
      drawer: createNavigationDrawer(),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
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
                                child: Obx(() {
                                  return CircleAvatar(
                                    child: AvatarCircle(
                                        width: 200,
                                        height: 200,
                                        source: controller.user.value?.avatar),
                                  );
                                }),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    CustomModalSheet.buildChoosePhotoBottom(
                                      context: context,
                                      onTappedCamera: () async {
                                        await controller
                                            .uploadAvatar(ImageSource.camera);
                                        Get.back(canPop: true);
                                      },
                                      onTappedGallery: () async {
                                        await controller
                                            .uploadAvatar(ImageSource.gallery);
                                        Get.back(canPop: true);
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
                            validator: (value) =>
                                FieldValidator.nameValidator(value!)),
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
                          stringRef: controller.countryCode,
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
                        BirthdatePickerTextField(
                          textEditingController: controller.birthDate,
                        ),
                        sh_20,
                        SingleChoiceTextField(
                          options: userLevels.keys.toList(),
                          selectedOption: controller.selectedOption,
                          title: "My Level",
                        ),
                        sh_20,
                        Text(
                          "Learns Topic",
                          style: BaseTextStyle.heading1(fontSize: 16),
                        ),
                        MultiSelectDialogField(
                          initialValue: controller.appState.user.learnTopics ??
                              <LearnTopic>[],
                          selectedItemsTextStyle:
                              themeData.textTheme.labelMedium,
                          items: controller.learnsTopic
                              .map((e) => MultiSelectItem(e, e.name!))
                              .toList(),
                          onConfirm: (values) async {
                            controller.selectLearnTopicListId =
                                values.map((e) => e.id!).toList();
                          },
                        ),
                        sh_20,
                        Text(
                          "Test Preparetation",
                          style: BaseTextStyle.heading1(fontSize: 16),
                        ),
                        MultiSelectDialogField(
                          initialValue:
                              controller.user.value?.testPreparations ??
                                  <TestPreparation>[],
                          selectedItemsTextStyle:
                              themeData.textTheme.labelMedium,
                          items: controller.testPrepareations
                              .map((e) => MultiSelectItem(e, e.name!))
                              .toList(),
                          onConfirm: (values) async {
                            controller.selectTestPreparetationOptionList =
                                values.map((e) => e.id!).toList();
                          },
                        ),
                        sh_20,
                        titleAndText(
                          maxline: 5,
                          title: "Study Schedule",
                          textTheme: themeData.textTheme,
                          hint: 'type whatever',
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ElevatedButton(
          onPressed: () async {
            await controller.updateInfo();
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
      String? Function(String?)? validator,
      int? maxline}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: BaseTextStyle.heading1(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue: initialValue,
          maxLines: maxline,
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

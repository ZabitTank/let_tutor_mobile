import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/core/utils/field_validation.dart';

class ProfileController extends GetxController {
  final appState = Get.find<AppStateController>();

  // imgae picker
  final ImagePicker _picker = ImagePicker();
  XFile? uploadImage;

  // dispose ???
  late Rxn<MyUserInfo> user;

  // dipose
  var isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryConller = TextEditingController();
  final Rx<String?> countryCode = RxString("");

  final TextEditingController birthDate = TextEditingController();
  final selectedOption = RxString("");
  var selectLearnTopicListId = <int>[];
  var selectTestPreparetationOptionList = <int>[];
  late final List<TestPreparation> testPrepareations;
  late final List<LearnTopic> learnsTopic;

  @override
  void onClose() {
    user.close();
    isLoading.close();
    countryCode.close();
    nameController.dispose();
    countryConller.dispose();
    birthDate.dispose();
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    try {
      testPrepareations =
          await LetTutorAPIService.valueAPIService.getTestPreparation();

      learnsTopic = await LetTutorAPIService.valueAPIService.getLearnTopics();

      appState.setUser = await LetTutorAPIService.userAPIService.getMe();

      user = Rxn(appState.user);

      selectedOption.value = appState.user.level ?? "BEGINNER";
      nameController.text = appState.user.name ?? "";
      countryConller.text = appState.user.country ?? "";
      birthDate.text = appState.user.birthday ?? "";
    } catch (e) {
      showSnackBar("Error", e.toString());
      return;
    } finally {
      isLoading.value = false;
    }
  }

  Future uploadAvatar(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile == null) return;
      uploadImage = pickedFile;

      final newUserInfo =
          await LetTutorAPIService.userAPIService.uploadAvatar(uploadImage!);

      appState.setUser = newUserInfo;
      user.value = appState.user;
    } catch (e) {
      debugPrint('Failed to pick image: ${e.toString()}');
    }
  }

  Future<void> updateInfo() async {
    if (!await FieldValidator.validateField(formKey)) {
      return;
    }

    try {
      EasyLoading.show();
      final newUserInfo = await LetTutorAPIService.userAPIService.updateInfo(
          name: nameController.text,
          level: selectedOption.value,
          birthday: birthDate.text,
          country: countryCode.value,
          learnTopics: selectLearnTopicListId,
          testPreparations: selectTestPreparetationOptionList);

      appState.setUser = newUserInfo;
      user.value = appState.user;
      showSnackBar("Update Sucess", "");
    } catch (e) {
      showSnackBar("Update Failed", e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}

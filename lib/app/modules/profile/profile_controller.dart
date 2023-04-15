import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  final appState = Get.find<AppStateController>();
  final ImagePicker _picker = ImagePicker();
  XFile? uploadImage;

  // dispose ???
  Rxn<MyUserInfo>? user;

  // dipose
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryConller = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  final selectedOption = RxString("");
  var selectLevelOptionList = <String?>[];

  @override
  void onInit() {
    super.onInit();
    user = appState.rxUser;
    nameController.text = user?.value?.name ?? "";
    countryConller.text = user?.value?.country ?? "";
    birthDate.text = user?.value?.birthday ?? "";
  }

  @override
  void onClose() {
    isLoading.close();
    nameController.dispose();
    countryConller.dispose();
    birthDate.dispose();
    super.onClose();
  }

  Future takePhoto(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile == null) return;
      uploadImage = pickedFile;

      final newUserInfo =
          await LetTutorAPIService.userAPIService.uploadAvatar(uploadImage!);

      appState.setUser = newUserInfo;
    } catch (e) {
      debugPrint('Failed to pick image: ${e.toString()}');
    }
  }

  validateAndSave() {}
}

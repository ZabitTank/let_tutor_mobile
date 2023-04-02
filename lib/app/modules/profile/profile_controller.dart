import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  final appState = Get.find<AppStateController>();
  final ImagePicker _picker = ImagePicker();
  XFile? uploadImage;

  // dipose
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryConller = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  final selectedOption = RxString("");
  var selectLevelOptionList = <String?>[];

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
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: ${e.message}');
    }
  }

  validateAndSave() {}
}

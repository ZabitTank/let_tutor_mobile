import 'package:get/get.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class CoursePdfController extends GetxController {
  late PDFDocument doc;
  final isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    try {
      isLoading.value = true;
      doc = await PDFDocument.fromURL(Get.arguments['requestId'] as String);
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    isLoading.close();
    super.onClose();
  }
}

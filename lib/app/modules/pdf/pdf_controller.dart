import 'package:get/get.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/course.dart';

class CoursePdfController extends GetxController {
  late PDFDocument doc;
  final isLoading = true.obs;
  late Topic topic;
  @override
  void onInit() async {
    super.onInit();
    try {
      isLoading.value = true;
      topic = Get.arguments;
      doc = await PDFDocument.fromURL(topic.nameFile ??
          "https://www.nhlbi.nih.gov/files/docs/public/sleep/healthy_sleep.pdf");
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

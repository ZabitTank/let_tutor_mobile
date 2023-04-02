import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/pdf/pdf_controller.dart';

class CoursePdfView extends GetView<CoursePdfController> {
  const CoursePdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
      ),
      body: Obx(
        () => Center(
          child: controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : PDFViewer(
                  document: controller.doc,
                  zoomSteps: 1,
                  //uncomment below line to preload all pages
                  lazyLoad: false,
                  // uncomment below line to scroll vertically
                  scrollDirection: Axis.vertical,
                ),
        ),
      ),
    );
  }
}

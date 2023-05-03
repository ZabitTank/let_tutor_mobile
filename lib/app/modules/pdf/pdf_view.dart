import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/pdf/pdf_controller.dart';

class CoursePdfView extends GetView<CoursePdfController> {
  const CoursePdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
                context: context,
                title:
                    "${controller.topic.orderCourse ?? 0}. ${controller.topic.name ?? "Topic name"}",
              ),
              body: Center(
                child: PDFViewer(
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

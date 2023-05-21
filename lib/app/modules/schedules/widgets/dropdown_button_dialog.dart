import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class CancelBookingDialog extends StatefulWidget {
  final List<CancelReason> options;

  const CancelBookingDialog(
      {super.key, required this.options, required this.bookId});
  final String bookId;
  @override
  CancelBookingDialogState createState() => CancelBookingDialogState();
}

class CancelBookingDialogState extends State<CancelBookingDialog> {
  int? selectedOptions;
  String note = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text(
              "What was the reason you cancel this booking?",
              style: BaseTextStyle.body1(),
            ),
            DropdownButtonFormField<int>(
              value: selectedOptions,
              items: widget.options.map((e) {
                return DropdownMenuItem<int>(
                  value: e.id,
                  child:
                      Text(e.reason!, style: BaseTextStyle.body3(fontSize: 12)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedOptions = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                note = value;
              },
              maxLines: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back(result: false);
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      if (selectedOptions == null) {
                        showSnackBar("You must choose a reason", "");
                      } else {
                        await LetTutorAPIService.scheDuleAPIService
                            .deleteBooking(
                          widget.bookId,
                          selectedOptions.toString(),
                          note,
                        );
                      }
                    } catch (_) {
                      showSnackBar("Failed", "Cancel Booking faild");
                    } finally {
                      Get.back(result: true);
                    }
                  },
                  child: const Text("Yes"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

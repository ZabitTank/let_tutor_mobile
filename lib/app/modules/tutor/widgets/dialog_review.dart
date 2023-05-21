import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/feedback.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/feedback_response.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';

import 'package:let_tutor_mobile/app/modules/_global_widget/custom_pagination.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';

class ReviewsDialog extends StatefulWidget {
  const ReviewsDialog({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String userId;

  @override
  State<ReviewsDialog> createState() => _ReviewsDialogState();
}

class _ReviewsDialogState extends State<ReviewsDialog> {
  FeedbacksResponse? feedbacksResponse;
  int page = 1;
  int perPage = 8;
  int totalPage = 1;

  @override
  void initState() {
    _fetch();
    super.initState();
  }

  Future<void> _fetch() async {
    LetTutorAPIService.tutorAPIService
        .getReviews(perPage: perPage, page: page, id: widget.userId)
        .then((value) {
      setState(() {
        feedbacksResponse = value;
        totalPage = (feedbacksResponse!.count / perPage).ceil();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Rating and Comment", style: context.headlineSmall),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Column(
                children: List.generate(
                  feedbacksResponse?.rows.length ?? 0,
                  (index) => ReviewCard(
                    review: feedbacksResponse!.rows[index],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: PaginationSection(
                  currentPage: page,
                  totalPages: totalPage,
                  onPageChanged: (newPage) async {
                    if (newPage > totalPage || newPage < 1) {
                      return;
                    } else {
                      page = newPage;
                      _fetch();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.review,
  }) : super(key: key);

  final Review review;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(review.firstInfo?.avatar ?? ""),
                  radius: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    5,
                    (index) => Container(
                      padding: const EdgeInsets.only(right: 4),
                      child: Icon(
                        index < review.rating - 0.5
                            ? Icons.star
                            : index - review.rating + 0.5 > 0
                                ? Icons.star_border
                                : Icons.star_half,
                        color: Colors.yellow[700],
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        review.firstInfo?.name ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      // const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(review.content ?? ""),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd – kk:mm')
                            .format(review.createdAt!),
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

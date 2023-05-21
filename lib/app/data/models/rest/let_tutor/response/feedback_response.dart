import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/feedback.dart';

part 'feedback_response.g.dart';

@JsonSerializable()
class FeedbacksResponse {
  int count;
  List<Review> rows;
  FeedbacksResponse({required this.count, required this.rows});

  factory FeedbacksResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedbacksResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbacksResponseToJson(this);
}

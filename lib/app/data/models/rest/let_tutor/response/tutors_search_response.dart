import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/tutor_info_detail.dart';

part 'tutors_search_response.g.dart';

@JsonSerializable()
class TutorsSearchResponse {
  List<TutorInfoDetail> rows;
  List<TutorInfoDetail>? favorite;
  final int count;
  TutorsSearchResponse({
    required this.rows,
    required this.count,
  });

  factory TutorsSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$TutorsSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TutorsSearchResponseToJson(this);
}

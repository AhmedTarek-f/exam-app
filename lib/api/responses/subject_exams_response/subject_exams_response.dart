import 'package:exam_app/api/models/subject_exams/subject_exam_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_exams_response.g.dart';

@JsonSerializable()
class SubjectExamsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "exams")
  final List<SubjectExamModel>? subjectExams;

  SubjectExamsResponse({this.message, this.subjectExams});

  factory SubjectExamsResponse.fromJson(Map<String, dynamic> json) {
    return _$SubjectExamsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectExamsResponseToJson(this);
  }
}

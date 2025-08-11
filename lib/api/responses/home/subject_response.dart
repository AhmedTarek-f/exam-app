import 'package:exam_app/api/models/home/subject_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "subjects")
  final List<SubjectModel>? subjects;

  SubjectResponse({this.message, this.subjects});

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$SubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectResponseToJson(this);
  }
}

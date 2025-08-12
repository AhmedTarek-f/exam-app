import 'package:exam_app/domain/entities/subject_exams/subject_exam_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_exam_model.g.dart';

@JsonSerializable()
class SubjectExamModel {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectExamModel({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory SubjectExamModel.fromJson(Map<String, dynamic> json) {
    return _$SubjectExamModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectExamModelToJson(this);
  }

  SubjectExamEntity toSubjectExamEntity() {
    return SubjectExamEntity(
      examId: id ?? "",
      examTitle: title ?? "",
      examDuration: duration ?? 0,
      examNumberOfQuestions: numberOfQuestions ?? 0,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:exam_app/domain/entities/subject_exams/subject_exam_entity.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class SubjectExamsState {}

final class SubjectExamsInitial extends SubjectExamsState {}

final class FetchSubjectExamsLoadingState extends SubjectExamsState {}

final class FetchSubjectExamsFailureState extends SubjectExamsState {
  FetchSubjectExamsFailureState({required this.errorData});
  final ResponseException errorData;
}

final class FetchSubjectExamsSuccessState extends SubjectExamsState
    with EquatableMixin {
  FetchSubjectExamsSuccessState({required this.subjectExams});
  final List<SubjectExamEntity> subjectExams;

  @override
  List<Object?> get props => [subjectExams];
}

final class StartExamState extends SubjectExamsState {}

import 'package:equatable/equatable.dart';

class SubjectExamEntity extends Equatable {
  const SubjectExamEntity({
    required this.examId,
    required this.examTitle,
    required this.examDuration,
    required this.examNumberOfQuestions,
  });
  final String examId;
  final String examTitle;
  final int examDuration;
  final int examNumberOfQuestions;

  @override
  List<Object?> get props => [
    examId,
    examTitle,
    examDuration,
    examNumberOfQuestions,
  ];
}

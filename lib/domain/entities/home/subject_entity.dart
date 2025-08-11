import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  const SubjectEntity({
    required this.subjectId,
    required this.subjectTitle,
    required this.subjectIcon,
  });
  final String subjectId;
  final String subjectTitle;
  final String subjectIcon;

  @override
  List<Object?> get props => [subjectId, subjectTitle, subjectIcon];
}

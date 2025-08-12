import 'package:exam_app/domain/entities/home/subject_entity.dart';

sealed class HomeIntent {}

class GetAllSubjectsIntent extends HomeIntent {}

class NavigateToSubjectExamsIntent extends HomeIntent {
  NavigateToSubjectExamsIntent({required this.subjectData});
  final SubjectEntity subjectData;
}

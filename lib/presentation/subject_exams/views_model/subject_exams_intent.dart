sealed class SubjectExamsIntent {}

class GetAllSubjectExamsIntent extends SubjectExamsIntent {
  final String subjectId;

  GetAllSubjectExamsIntent({required this.subjectId});
}

class StartExamIntent extends SubjectExamsIntent {}

import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/entities/subject_exams/subject_exam_entity.dart';

abstract class SubjectExamsRepository {
  Future<Result<List<SubjectExamEntity>>> getAllSubjectExams({
    required String subjectId,
  });
}

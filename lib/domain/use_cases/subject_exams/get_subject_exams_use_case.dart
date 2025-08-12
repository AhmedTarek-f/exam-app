import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/entities/subject_exams/subject_exam_entity.dart';
import 'package:exam_app/domain/repositories/subject_exams/subject_exams_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubjectExamsUseCase {
  final SubjectExamsRepository _subjectExamsRepository;
  @factoryMethod
  const GetSubjectExamsUseCase(this._subjectExamsRepository);

  Future<Result<List<SubjectExamEntity>>> invoke({
    required String subjectId,
  }) async {
    return await _subjectExamsRepository.getAllSubjectExams(
      subjectId: subjectId,
    );
  }
}

import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/data/data_source/subject_exams/remote_data_source/subject_exams_remote_data_source.dart';
import 'package:exam_app/domain/entities/subject_exams/subject_exam_entity.dart';
import 'package:exam_app/domain/repositories/subject_exams/subject_exams_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubjectExamsRepository)
class SubjectExamsRepositoryImpl implements SubjectExamsRepository {
  final SubjectExamsRemoteDataSource _subjectExamsRemoteDataSource;

  const SubjectExamsRepositoryImpl(this._subjectExamsRemoteDataSource);

  @override
  Future<Result<List<SubjectExamEntity>>> getAllSubjectExams({
    required String subjectId,
  }) async {
    return await _subjectExamsRemoteDataSource.getAllSubjectExams(
      subjectId: subjectId,
    );
  }
}

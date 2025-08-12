import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/data/data_source/subject_exams/remote_data_source/subject_exams_remote_data_source.dart';
import 'package:exam_app/domain/entities/subject_exams/subject_exam_entity.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubjectExamsRemoteDataSource)
class SubjectExamsRemoteDataSourceImpl implements SubjectExamsRemoteDataSource {
  final ApiClient _apiClient;
  const SubjectExamsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<List<SubjectExamEntity>>> getAllSubjectExams({
    required String subjectId,
  }) async {
    return executeApi(() async {
      var result = await _apiClient.getAllSubjectExams(
        token: ExamMethodHelper.currentUserToken ?? "",
        subjectId: subjectId,
      );
      final subjectExamsEntities =
          result.subjectExams
              ?.map((subject) => subject.toSubjectExamEntity())
              .toList() ??
          [];
      return subjectExamsEntities;
    });
  }
}

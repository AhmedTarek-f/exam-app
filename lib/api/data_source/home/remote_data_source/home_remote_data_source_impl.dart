import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/data/data_source/home/remote_data_source/home_remote_data_source.dart';
import 'package:exam_app/domain/entities/home/subject_entity.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;
  const HomeRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<List<SubjectEntity>>> getAllSubjects() {
    return executeApi(() async {
      var response = await _apiClient.getAllSubjects(
        token: ExamMethodHelper.currentUserToken ?? "",
      );
      final subjectEntitiesList = response.subjects
          ?.map((subject) => subject.toSubjectEntity())
          .toList();
      return subjectEntitiesList ?? [];
    });
  }
}

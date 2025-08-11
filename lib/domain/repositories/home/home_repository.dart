import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/entities/home/subject_entity.dart';

abstract class HomeRepository {
  Future<Result<List<SubjectEntity>>> getAllSubjects();
}

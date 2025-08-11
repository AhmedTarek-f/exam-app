import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/entities/home/subject_entity.dart';
import 'package:exam_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllSubjectsUseCase {
  final HomeRepository _homeRepository;
  const GetAllSubjectsUseCase(this._homeRepository);

  Future<Result<List<SubjectEntity>>> invoke() async {
    return await _homeRepository.getAllSubjects();
  }
}

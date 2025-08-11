import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/data/data_source/home/remote_data_source/home_remote_data_source.dart';
import 'package:exam_app/domain/entities/home/subject_entity.dart';
import 'package:exam_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  const HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Result<List<SubjectEntity>>> getAllSubjects() async {
    return await _homeRemoteDataSource.getAllSubjects();
  }
}

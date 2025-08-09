import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/data/data_source/profile/remote_data_source/profile_remote_data_source.dart';
import 'package:exam_app/domain/repositories/profile/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  @factoryMethod
  const ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Result<void>> logout() async {
    return await profileRemoteDataSource.logout();
  }
}

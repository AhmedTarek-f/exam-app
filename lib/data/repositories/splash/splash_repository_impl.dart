import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/data/data_source/splash/remote_data_source/splash_remote_data_source.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';
import 'package:exam_app/domain/repositories/splash/splash_repository.dart';

@Injectable(as: SplashRepository)
class SplashRepositoryImpl implements SplashRepository {
  final SplashRemoteDataSource splashRemoteDataSource;
  @factoryMethod
  const SplashRepositoryImpl({required this.splashRemoteDataSource});

  @override
  Future<Result<UserDataEntity?>> getUserData() async {
    return await splashRemoteDataSource.getUserData();
  }
}

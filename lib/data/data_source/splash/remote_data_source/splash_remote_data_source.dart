import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';

abstract class SplashRemoteDataSource {
  Future<Result<UserDataEntity?>> getUserData();
}

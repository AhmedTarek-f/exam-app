import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';
import 'package:exam_app/domain/repositories/splash/splash_repository.dart';

@injectable
class GetUserUseCase {
  final SplashRepository _splashRepository;
  @factoryMethod
  const GetUserUseCase(this._splashRepository);

  Future<Result<UserDataEntity?>> invoke() async {
    return await _splashRepository.getUserData();
  }
}

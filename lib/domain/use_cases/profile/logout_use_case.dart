import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/repositories/profile/profile_repository.dart';

@injectable
class LogoutUseCase {
  final ProfileRepository _profileRepository;
  @factoryMethod
  const LogoutUseCase(this._profileRepository);

  Future<Result<void>> invoke() async {
    return await _profileRepository.logout();
  }
}

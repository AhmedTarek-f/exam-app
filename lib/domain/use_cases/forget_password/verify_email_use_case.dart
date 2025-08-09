import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/repositories/forget_password/email_verification_repository.dart';

@injectable
class VerifyEmailUseCase {
  final EmailVerificationRepository _emailVerificationRepository;
  @factoryMethod
  const VerifyEmailUseCase(this._emailVerificationRepository);

  Future<Result<String?>> invoke({required String code}) async {
    return await _emailVerificationRepository.verifyEmail(code: code);
  }
}

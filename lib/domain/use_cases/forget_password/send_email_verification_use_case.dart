import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/repositories/forget_password/forget_password_email_repository.dart';

@injectable
class SendEmailVerificationUseCase {
  final ForgetPasswordEmailRepository _forgetPasswordEmailRepository;
  @factoryMethod
  const SendEmailVerificationUseCase(this._forgetPasswordEmailRepository);

  Future<Result<String?>> invoke({required String email}) async {
    return await _forgetPasswordEmailRepository.sendEmailVerification(
      email: email,
    );
  }
}

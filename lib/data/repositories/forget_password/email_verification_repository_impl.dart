import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/data/data_source/forget_password/email_verification/remote_data_source/email_verification_remote_data_source.dart';
import 'package:exam_app/domain/repositories/forget_password/email_verification_repository.dart';

@Injectable(as: EmailVerificationRepository)
class EmailVerificationRepositoryImpl implements EmailVerificationRepository {
  final EmailVerificationRemoteDataSource emailVerificationRemoteDataSource;
  @factoryMethod
  const EmailVerificationRepositoryImpl({
    required this.emailVerificationRemoteDataSource,
  });

  @override
  Future<Result<String?>> verifyEmail({required String code}) async {
    return await emailVerificationRemoteDataSource.verifyEmailCode(code: code);
  }
}

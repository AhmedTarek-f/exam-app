import 'package:exam_app/api/client/api_result.dart';

abstract class EmailVerificationRemoteDataSource {
  Future<Result<String?>> verifyEmailCode({required String code});
}

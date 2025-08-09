import 'package:exam_app/api/client/api_result.dart';

abstract class EmailVerificationRepository {
  Future<Result<String?>> verifyEmail({required String code});
}

import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/reset_password_request/reset_password_request.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<Result<String?>> resetPassword({
    required ResetPasswordRequest request,
  });
}

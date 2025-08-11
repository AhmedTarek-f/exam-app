import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/change_password_request/change_password_request.dart';

abstract class ChangePasswordRepository {
  Future<Result<void>> changePassword({required ChangePasswordRequest request});
}

import 'package:exam_app/api/client/api_result.dart';

abstract class ForgetPasswordEmailRepository {
  Future<Result<String?>> sendEmailVerification({required String email});
}

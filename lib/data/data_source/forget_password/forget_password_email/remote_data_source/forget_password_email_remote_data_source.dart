import 'package:exam_app/api/client/api_result.dart';

abstract class ForgetPasswordEmailRemoteDataSource {
  Future<Result<String?>> sendEmailVerification({required String email});
}

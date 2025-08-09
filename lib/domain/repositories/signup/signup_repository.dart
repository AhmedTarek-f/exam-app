import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/signup_request/signup_request.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';

abstract class SignupRepository {
  Future<Result<UserDataEntity?>> signup({required SignupRequest request});
}

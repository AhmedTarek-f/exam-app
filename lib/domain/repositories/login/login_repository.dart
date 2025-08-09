import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/login_request/login_request.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';

abstract class LoginRepository {
  Future<Result<UserDataEntity?>> login({required LoginRequest request});
}

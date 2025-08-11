import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/login_request/login_request.dart';
import 'package:exam_app/data/data_source/login/remote_data_source/login_remote_data_source.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:exam_app/utils/secure_storage/secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiClient _apiClient;
  final SecureStorage _secureStorage;
  const LoginRemoteDataSourceImpl(this._apiClient, this._secureStorage);
  @override
  Future<Result<UserDataEntity?>> login({required LoginRequest request}) async {
    return executeApi(() async {
      var response = await _apiClient.login(request: request);
      ExamMethodHelper.currentUserToken = response.token;
      await _secureStorage.saveUserToken(token: response.token);
      var userData = response.userLoginData?.toUserDataEntity();
      ExamMethodHelper.userData = userData;
      return userData;
    });
  }
}

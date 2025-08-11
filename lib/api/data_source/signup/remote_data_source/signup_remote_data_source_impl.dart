import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/signup_request/signup_request.dart';
import 'package:exam_app/data/data_source/signup/remote_data_source/signup_remote_data_source.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:exam_app/utils/secure_storage/secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRemoteDataSource)
class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  final ApiClient _apiClient;
  final SecureStorage _secureStorage;
  const SignupRemoteDataSourceImpl(this._apiClient, this._secureStorage);

  @override
  Future<Result<UserDataEntity?>> signup({
    required SignupRequest request,
  }) async {
    return executeApi(() async {
      var response = await _apiClient.signup(request: request);
      ExamMethodHelper.currentUserToken = response.token;
      await _secureStorage.saveUserToken(token: response.token);
      var userData = response.user?.toUserDataEntity();
      ExamMethodHelper.userData = userData;
      return userData;
    });
  }
}

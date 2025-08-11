import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/change_password_request/change_password_request.dart';
import 'package:exam_app/data/data_source/change_password/remote_data_source/change_password_remote_data_source.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:exam_app/utils/secure_storage/secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRemoteDataSource)
class ChangePasswordRemoteDataSourceImpl
    implements ChangePasswordRemoteDataSource {
  final ApiClient _apiClient;
  final SecureStorage _secureStorage;
  const ChangePasswordRemoteDataSourceImpl(
    this._apiClient,
    this._secureStorage,
  );
  @override
  Future<Result<void>> changePassword({
    required ChangePasswordRequest request,
  }) async {
    return executeApi(() async {
      var response = await _apiClient.changePassword(
        token: ExamMethodHelper.currentUserToken ?? "",
        request: request,
      );
      await _secureStorage.saveUserToken(token: response.token);
      ExamMethodHelper.currentUserToken = response.token;
    });
  }
}

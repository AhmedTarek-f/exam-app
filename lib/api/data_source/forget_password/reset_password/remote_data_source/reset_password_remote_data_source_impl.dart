import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/reset_password_request/reset_password_request.dart';
import 'package:exam_app/data/data_source/forget_password/reset_password/remote_data_source/reset_password_remote_data_source.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  final ApiClient _apiClient;
  const ResetPasswordRemoteDataSourceImpl(this._apiClient);
  @override
  Future<Result<String?>> resetPassword({
    required ResetPasswordRequest request,
  }) async {
    return executeApi(() async {
      var response = await _apiClient.resetPassword(request: request);
      return response.message;
    });
  }
}

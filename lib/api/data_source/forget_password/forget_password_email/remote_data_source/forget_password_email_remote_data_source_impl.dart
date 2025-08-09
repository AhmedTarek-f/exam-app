import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/forget_password_request/forget_password_email_request.dart';

import '../../../../../data/data_source/forget_password/forget_password_email/remote_data_source/forget_password_email_remote_data_source.dart';

@Injectable(as: ForgetPasswordEmailRemoteDataSource)
class ForgetPasswordEmailRemoteDataSourceImpl
    implements ForgetPasswordEmailRemoteDataSource {
  final ApiClient _apiClient;
  const ForgetPasswordEmailRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<String?>> sendEmailVerification({required String email}) async {
    return executeApi(() async {
      var response = await _apiClient.sendEmailVerification(
        request: ForgetPasswordEmailRequest(email: email),
      );
      return response.info;
    });
  }
}

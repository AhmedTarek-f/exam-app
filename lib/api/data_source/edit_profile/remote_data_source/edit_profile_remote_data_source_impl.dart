import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/edit_profile_request/edit_profile_request.dart';
import 'package:exam_app/data/data_source/edit_profile/remote_data_source/edit_profile_remote_data_source.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  final ApiClient _apiClient;
  const EditProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<void>> editProfile({
    required EditProfileRequest request,
  }) async {
    return executeApi(() async {
      var response = await _apiClient.editProfile(
        token: ExamMethodHelper.currentUserToken ?? "",
        request: request,
      );
      var userData = response.user?.toUserLoginEntity();
      ExamMethodHelper.userData = userData;
    });
  }
}

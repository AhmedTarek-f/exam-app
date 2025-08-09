import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/core/constants/const_keys.dart';
import 'package:exam_app/data/data_source/profile/remote_data_source/profile_remote_data_source.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:exam_app/utils/secure_storage/secure_storage.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient _apiClient;
  const ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<void>> logout() async {
    return executeApi(() async {
      await _apiClient.logout(token: ExamMethodHelper.currentUserToken ?? "");
      await SecureStorage.deleteData(key: ConstKeys.tokenKey);
      ExamMethodHelper.userData = null;
    });
  }
}

import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/data/data_source/splash/remote_data_source/splash_remote_data_source.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';
import 'package:exam_app/utils/exam_method_helper.dart';

@Injectable(as: SplashRemoteDataSource)
class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final ApiClient apiClient;
  @factoryMethod
  const SplashRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<Result<UserDataEntity?>> getUserData() async {
    return executeApi(() async {
      var response = await apiClient.getUserData(
        token: ExamMethodHelper.currentUserToken ?? "",
      );
      var userData = response.user?.toUserDataEntity();
      ExamMethodHelper.userData = userData;
      return userData;
    });
  }
}

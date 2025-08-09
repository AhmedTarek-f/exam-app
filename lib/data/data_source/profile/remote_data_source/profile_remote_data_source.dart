import 'package:exam_app/api/client/api_result.dart';

abstract class ProfileRemoteDataSource {
  Future<Result<void>> logout();
}

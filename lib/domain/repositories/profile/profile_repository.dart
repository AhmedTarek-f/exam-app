import 'package:exam_app/api/client/api_result.dart';

abstract class ProfileRepository {
  Future<Result<void>> logout();
}

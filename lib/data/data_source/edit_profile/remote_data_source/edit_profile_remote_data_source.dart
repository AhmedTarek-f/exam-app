import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/edit_profile_request/edit_profile_request.dart';

abstract class EditProfileRemoteDataSource {
  Future<Result<void>> editProfile({required EditProfileRequest request});
}

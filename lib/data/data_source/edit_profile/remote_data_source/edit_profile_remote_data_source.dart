import 'package:exam_app/api/requests/edit_profile_request/edit_profile_request.dart';

abstract class EditProfileRemoteDataSource {
  Future<void> editProfile({required EditProfileRequest request});
}

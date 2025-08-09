import 'package:exam_app/api/requests/edit_profile_request/edit_profile_request.dart';

abstract class EditProfileRepository {
  Future<void> editProfile({required EditProfileRequest request});
}

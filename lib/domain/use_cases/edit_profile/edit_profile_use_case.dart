import 'package:injectable/injectable.dart';
import 'package:exam_app/api/requests/edit_profile_request/edit_profile_request.dart';
import 'package:exam_app/domain/repositories/edit_profile/edit_profile_repository.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepository _editProfileRepository;
  @factoryMethod
  const EditProfileUseCase(this._editProfileRepository);

  Future<void> invoke({required EditProfileRequest request}) async {
    await _editProfileRepository.editProfile(request: request);
  }
}

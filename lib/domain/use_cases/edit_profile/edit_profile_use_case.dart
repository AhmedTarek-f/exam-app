import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/edit_profile_request/edit_profile_request.dart';
import 'package:exam_app/domain/repositories/edit_profile/edit_profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepository _editProfileRepository;
  @factoryMethod
  const EditProfileUseCase(this._editProfileRepository);

  Future<Result<void>> invoke({required EditProfileRequest request}) async {
    return await _editProfileRepository.editProfile(request: request);
  }
}

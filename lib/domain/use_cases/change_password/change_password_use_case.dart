import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/change_password_request/change_password_request.dart';
import 'package:exam_app/domain/repositories/change_password/change_password_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepository _changePasswordRepository;
  const ChangePasswordUseCase(this._changePasswordRepository);
  Future<Result<void>> invoke({required ChangePasswordRequest request}) async {
    return await _changePasswordRepository.changePassword(request: request);
  }
}

import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/change_password_request/change_password_request.dart';
import 'package:exam_app/data/data_source/change_password/remote_data_source/change_password_remote_data_source.dart';
import 'package:exam_app/domain/repositories/change_password/change_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final ChangePasswordRemoteDataSource _remoteDataSource;
  const ChangePasswordRepositoryImpl(this._remoteDataSource);
  @override
  Future<Result<void>> changePassword({
    required ChangePasswordRequest request,
  }) async {
    return await _remoteDataSource.changePassword(request: request);
  }
}

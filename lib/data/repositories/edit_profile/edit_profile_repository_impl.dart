import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/edit_profile_request/edit_profile_request.dart';
import 'package:exam_app/data/data_source/edit_profile/remote_data_source/edit_profile_remote_data_source.dart';
import 'package:exam_app/domain/repositories/edit_profile/edit_profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImpl implements EditProfileRepository {
  final EditProfileRemoteDataSource editProfileRemoteDataSource;
  @factoryMethod
  const EditProfileRepositoryImpl({required this.editProfileRemoteDataSource});

  @override
  Future<Result<void>> editProfile({
    required EditProfileRequest request,
  }) async {
    return await editProfileRemoteDataSource.editProfile(request: request);
  }
}

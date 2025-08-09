import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/signup_request/signup_request.dart';
import 'package:exam_app/data/data_source/signup/remote_data_source/signup_remote_data_source.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';
import 'package:exam_app/domain/repositories/signup/signup_repository.dart';

@Injectable(as: SignupRepository)
class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDataSource signupRemoteDataSource;
  @factoryMethod
  const SignupRepositoryImpl({required this.signupRemoteDataSource});

  @override
  Future<Result<UserDataEntity?>> signup({
    required SignupRequest request,
  }) async {
    return await signupRemoteDataSource.signup(request: request);
  }
}

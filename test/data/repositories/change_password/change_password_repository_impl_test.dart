import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/change_password_request/change_password_request.dart';
import 'package:exam_app/data/data_source/change_password/remote_data_source/change_password_remote_data_source.dart';
import 'package:exam_app/data/repositories/change_password/change_password_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_repository_impl_test.mocks.dart';

@GenerateMocks([ChangePasswordRemoteDataSource])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'when call changePassword it should be called successfully from remoteDataSource and return Success<void>',
    () async {
      // Arrange
      final mockedChangePasswordRemoteDataSource =
          MockChangePasswordRemoteDataSource();
      final changePasswordRepositoryImpl = ChangePasswordRepositoryImpl(
        mockedChangePasswordRemoteDataSource,
      );
      final request = ChangePasswordRequest(
        password: "oldPassword",
        oldPassword: 'newPassword',
        rePassword: 'newPassword',
      );

      final expectedResult = Success(null);
      provideDummy<Result<void>>(expectedResult);
      when(
        mockedChangePasswordRemoteDataSource.changePassword(request: request),
      ).thenAnswer((_) async => expectedResult);

      // Act
      final result = await changePasswordRepositoryImpl.changePassword(
        request: request,
      );

      // Assert
      expect(result, isA<Success<void>>());
      verify(
        mockedChangePasswordRemoteDataSource.changePassword(request: request),
      ).called(1);
    },
  );
}

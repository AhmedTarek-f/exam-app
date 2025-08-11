import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/change_password_request/change_password_request.dart';
import 'package:exam_app/domain/repositories/change_password/change_password_repository.dart';
import 'package:exam_app/domain/use_cases/change_password/change_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_use_case_test.mocks.dart';

@GenerateMocks([ChangePasswordRepository])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'when call invoke it should call changePassword from changePasswordRepository successfully and return a Success<void>',
    () async {
      // Arrange
      final mockedChangePasswordRepository = MockChangePasswordRepository();
      final request = ChangePasswordRequest(
        password: "oldPassword",
        oldPassword: 'newPassword',
        rePassword: 'newPassword',
      );
      final changePasswordUseCase = ChangePasswordUseCase(
        mockedChangePasswordRepository,
      );
      final expectedResult = Success<void>(null);
      provideDummy<Result<void>>(expectedResult);
      when(
        mockedChangePasswordRepository.changePassword(request: request),
      ).thenAnswer((_) async => expectedResult);

      // Act
      var result = await changePasswordUseCase.invoke(request: request);

      // Assert
      expect(result, isA<Success<void>>());
      verify(
        mockedChangePasswordRepository.changePassword(request: request),
      ).called(1);
    },
  );
}

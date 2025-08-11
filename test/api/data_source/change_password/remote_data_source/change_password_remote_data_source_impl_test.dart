import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exam_app/api/client/api_client.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/data_source/change_password/remote_data_source/change_password_remote_data_source_impl.dart';
import 'package:exam_app/api/requests/change_password_request/change_password_request.dart';
import 'package:exam_app/api/responses/change_password_response/change_password_response.dart';
import 'package:exam_app/utils/connection_manager/connection_manager.dart';
import 'package:exam_app/utils/secure_storage/secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient, Connectivity, SecureStorage])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'when call changePassword it should be called successfully from apiClient and return ChangePasswordResponse',
    () async {
      // Arrange
      final mockedApiClient = MockApiClient();
      final mockedConnectivity = MockConnectivity();
      final mockedSecureStorage = MockSecureStorage();
      ConnectionManager.connectivity = mockedConnectivity;
      final remoteDataSource = ChangePasswordRemoteDataSourceImpl(
        mockedApiClient,
        mockedSecureStorage,
      );
      final request = ChangePasswordRequest(
        password: "oldPassword",
        oldPassword: 'newPassword',
        rePassword: 'newPassword',
      );
      final expectedData = ChangePasswordResponse(
        message: "success",
        token: "tokenData15521",
      );
      final expectedResult = Success(expectedData);
      provideDummy<Result<void>>(expectedResult);
      when(
        mockedConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.wifi]);
      when(
        mockedApiClient.changePassword(
          token: anyNamed("token"),
          request: request,
        ),
      ).thenAnswer((_) async => expectedData);

      // Act
      final result = await remoteDataSource.changePassword(request: request);

      // Assert
      expect(result, isA<Success<void>>());
      verify(
        mockedApiClient.changePassword(
          token: anyNamed("token"),
          request: request,
        ),
      ).called(1);
    },
  );
}

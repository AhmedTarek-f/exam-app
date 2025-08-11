import 'package:bloc_test/bloc_test.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/use_cases/change_password/change_password_use_case.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_cubit.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_intent.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_state.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fake_form_state.dart';
import 'change_password_cubit_test.mocks.dart';

@GenerateMocks([ChangePasswordUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockChangePasswordUseCase mockChangePasswordUseCase;
  late ChangePasswordCubit cubit;
  late Result expectedSuccessResult;
  late Failure expectedFailureResult;

  setUpAll(() {
    mockChangePasswordUseCase = MockChangePasswordUseCase();
    expectedFailureResult = Failure(
      errorMessage: "something went wrong",
      responseException: const ResponseException(
        message: "something went wrong",
        code: 0,
      ),
    );
    expectedSuccessResult = Success<void>(null);
    provideDummy<Result<void>>(expectedSuccessResult);
    provideDummy<Result<void>>(expectedFailureResult);
  });

  setUp(() {
    cubit = ChangePasswordCubit(mockChangePasswordUseCase);
    cubit.doIntent(intent: InitializeChangePasswordIntent());
    cubit.changePasswordFormKey = FakeGlobalKey(FakeFormState());
  });
  group("Change Password cubit test", () {
    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits ChangeCurrentPasswordObscureState when toggling current password visibility',
      build: () => cubit,
      act: (cubit) =>
          cubit.doIntent(intent: ToggleCurrentPasswordObscureIntent()),
      expect: () => [
        isA<ChangeCurrentPasswordObscureState>().having(
          (state) => state.isObscure,
          'when toggle current password obscure its value will be changed to false',
          false,
        ),
      ],
    );

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits [Loading, Success] when ChangePasswordPressedIntent succeeds',
      build: () {
        when(
          mockChangePasswordUseCase.invoke(request: anyNamed("request")),
        ).thenAnswer((_) async => expectedSuccessResult); // success
        return cubit;
      },
      act: (cubit) => cubit.doIntent(intent: ChangePasswordPressedIntent()),
      expect: () => [
        isA<ChangePasswordLoadingState>(),
        isA<ChangePasswordSuccessState>(),
      ],
      verify: (_) {
        verify(
          mockChangePasswordUseCase.invoke(request: anyNamed("request")),
        ).called(1);
      },
    );

    blocTest(
      "emits [Loading, Failure] when ChangePasswordPressedIntent is Called",
      build: () {
        when(
          mockChangePasswordUseCase.invoke(request: anyNamed("request")),
        ).thenAnswer((_) async => expectedFailureResult);
        return cubit;
      },
      act: (cubit) => cubit.doIntent(intent: ChangePasswordPressedIntent()),
      expect: () => [
        isA<ChangePasswordLoadingState>(),
        isA<ChangePasswordFailureState>()
            .having(
              (state) => state.errorData.message,
              'errorMessage',
              expectedFailureResult.errorMessage,
            )
            .having(
              (state) => state.errorData.message,
              'responseException.message',
              expectedFailureResult.responseException?.message,
            )
            .having(
              (state) => state.errorData.code,
              'responseException.code',
              expectedFailureResult.responseException?.code,
            ),
      ],
      verify: (_) {
        verify(
          mockChangePasswordUseCase.invoke(request: anyNamed("request")),
        ).called(1);
      },
    );
  });
  tearDownAll(() {
    cubit.close();
  });
}

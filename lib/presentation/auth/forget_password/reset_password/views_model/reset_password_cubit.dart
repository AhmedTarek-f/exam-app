import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/reset_password_request/reset_password_request.dart';
import 'package:exam_app/core/constants/const_keys.dart';
import 'package:exam_app/domain/use_cases/forget_password/reset_password_use_case.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views_model/reset_password_state.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;
  @factoryMethod
  ResetPasswordCubit({required this.resetPasswordUseCase})
    : super(ResetPasswordInitial()) {
    onInit();
  }
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmNewPasswordController;
  late final GlobalKey<FormState> changePasswordFormKey;

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void onInit() {
    changePasswordFormKey = GlobalKey<FormState>();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  void enableAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(EnableAutoValidateModeState());
  }

  void toggleNewPasswordObscure() {
    isPasswordObscure = !isPasswordObscure;
    emit(ChangeNewPasswordObscureState());
  }

  void toggleConfirmNewPasswordObscure() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    emit(ChangeConfirmNewPasswordObscureState());
  }

  Future<void> resetPassword({required String email}) async {
    if (changePasswordFormKey.currentState!.validate()) {
      emit(ResetPasswordLoadingState());
      var message = await resetPasswordUseCase.invoke(
        request: ResetPasswordRequest(
          email: email,
          newPassword: newPasswordController.text.trim(),
        ),
      );
      switch (message) {
        case Success<String?>():
          {
            if (message.data?.toLowerCase() == ConstKeys.success) {
              emit(ResetPasswordSuccessState());
            }
            break;
          }
        case Failure<String?>():
          emit(
            ResetPasswordFailureState(
              errorData:
                  message.responseException ??
                  ResponseException(code: 0, message: message.errorMessage),
            ),
          );
          break;
      }
    } else {
      enableAutoValidateMode();
    }
  }

  @override
  Future<void> close() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    return super.close();
  }
}

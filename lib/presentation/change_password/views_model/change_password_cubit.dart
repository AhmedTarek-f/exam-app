import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/change_password_request/change_password_request.dart';
import 'package:exam_app/domain/use_cases/change_password/change_password_use_case.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_intent.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_state.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordUseCase)
    : super(ChangePasswordInitial());
  final ChangePasswordUseCase _changePasswordUseCase;
  late final TextEditingController currentPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmNewPasswordController;
  late GlobalKey<FormState> changePasswordFormKey;

  ChangeCurrentPasswordObscureState _changeCurrentPasswordState =
      ChangeCurrentPasswordObscureState();
  ChangeNewPasswordObscureState _changeNewPasswordObscureState =
      ChangeNewPasswordObscureState();
  ChangeConfirmNewPasswordObscureState _changeConfirmNewPasswordObscureState =
      ChangeConfirmNewPasswordObscureState();

  Future<void> doIntent({required ChangePasswordIntent intent}) async {
    switch (intent) {
      case InitializeChangePasswordIntent():
        _onInit();
        break;
      case ToggleCurrentPasswordObscureIntent():
        _toggleCurrentPasswordObscure();
        break;
      case ToggleNewPasswordObscureIntent():
        _toggleNewPasswordObscure();
        break;
      case ToggleConfirmNewPasswordObscureIntent():
        _toggleConfirmNewPasswordObscure();
        break;
      case ChangePasswordPressedIntent():
        await _changePassword();
        break;
    }
  }

  void _onInit() {
    changePasswordFormKey = GlobalKey<FormState>();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  void _enableAutoValidateMode() {
    emit(
      EnableAutoValidateModeState(autoValidateMode: AutovalidateMode.always),
    );
  }

  void _toggleCurrentPasswordObscure() {
    _changeCurrentPasswordState = _changeCurrentPasswordState.copyWith(
      isObscurePassword: _changeCurrentPasswordState.isObscure,
    );
    emit(_changeCurrentPasswordState);
  }

  void _toggleNewPasswordObscure() {
    _changeNewPasswordObscureState = _changeNewPasswordObscureState.copyWith(
      isObscurePassword: _changeNewPasswordObscureState.isObscure,
    );
    emit(_changeNewPasswordObscureState);
  }

  void _toggleConfirmNewPasswordObscure() {
    _changeConfirmNewPasswordObscureState =
        _changeConfirmNewPasswordObscureState.copyWith(
          isObscurePassword:
              _changeConfirmNewPasswordObscureState.isObscureConfirm,
        );
    emit(_changeConfirmNewPasswordObscureState);
  }

  Future<void> _changePassword() async {
    if (changePasswordFormKey.currentState!.validate()) {
      emit(ChangePasswordLoadingState());
      var result = await _changePasswordUseCase.invoke(
        request: ChangePasswordRequest(
          oldPassword: currentPasswordController.text.trim(),
          password: newPasswordController.text.trim(),
          rePassword: confirmNewPasswordController.text.trim(),
        ),
      );
      switch (result) {
        case Success<void>():
          emit(ChangePasswordSuccessState());
          break;
        case Failure<void>():
          emit(
            ChangePasswordFailureState(
              errorData:
                  result.responseException ??
                  ResponseException(code: 0, message: result.errorMessage),
            ),
          );
          break;
      }
    } else {
      _enableAutoValidateMode();
    }
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    return super.close();
  }
}

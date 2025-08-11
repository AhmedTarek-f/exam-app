import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:flutter/material.dart';

sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class EnableAutoValidateModeState extends ChangePasswordState {
  EnableAutoValidateModeState({required this.autoValidateMode});
  final AutovalidateMode autoValidateMode;
}

final class ChangeCurrentPasswordObscureState extends ChangePasswordState {
  ChangeCurrentPasswordObscureState({this.isObscure = true});
  bool isObscure;

  ChangeCurrentPasswordObscureState copyWith({
    required bool isObscurePassword,
  }) {
    isObscurePassword = !isObscurePassword;
    return ChangeCurrentPasswordObscureState(isObscure: isObscurePassword);
  }
}

final class ChangeNewPasswordObscureState extends ChangePasswordState {
  ChangeNewPasswordObscureState({this.isObscure = true});
  bool isObscure;

  ChangeNewPasswordObscureState copyWith({required bool isObscurePassword}) {
    isObscurePassword = !isObscurePassword;
    return ChangeNewPasswordObscureState(isObscure: isObscurePassword);
  }
}

final class ChangeConfirmNewPasswordObscureState extends ChangePasswordState {
  ChangeConfirmNewPasswordObscureState({this.isObscureConfirm = true});
  bool isObscureConfirm;

  ChangeConfirmNewPasswordObscureState copyWith({
    required bool isObscurePassword,
  }) {
    isObscurePassword = !isObscurePassword;
    return ChangeConfirmNewPasswordObscureState(
      isObscureConfirm: isObscurePassword,
    );
  }
}

final class ChangePasswordSuccessState extends ChangePasswordState {}

final class ChangePasswordLoadingState extends ChangePasswordState {}

final class ChangePasswordFailureState extends ChangePasswordState {
  ChangePasswordFailureState({required this.errorData});
  final ResponseException errorData;
}

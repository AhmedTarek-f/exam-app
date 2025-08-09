import 'package:flutter/material.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class EnableAutoValidateModeState extends LoginState {
  EnableAutoValidateModeState({required this.autoValidateMode});
  final AutovalidateMode autoValidateMode;
}

final class ChangeObscureState extends LoginState {
  ChangeObscureState({this.isObscure = true});
  bool isObscure;

  ChangeObscureState copyWith({required bool isObscurePassword}) {
    isObscurePassword = !isObscurePassword;
    return ChangeObscureState(isObscure: isObscurePassword);
  }
}

final class LoginSuccessState extends LoginState {}

final class LoginFailureState extends LoginState {
  LoginFailureState({required this.errorData});
  final ResponseException errorData;
}

final class LoginLoadingState extends LoginState {}

final class ToggleRememberMeState extends LoginState {}

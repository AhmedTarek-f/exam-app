import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class EnableAutoValidateModeState extends ResetPasswordState {}

final class ChangeNewPasswordObscureState extends ResetPasswordState {}

final class ChangeConfirmNewPasswordObscureState extends ResetPasswordState {}

final class ResetPasswordSuccessState extends ResetPasswordState {}

final class ResetPasswordLoadingState extends ResetPasswordState {}

final class ResetPasswordFailureState extends ResetPasswordState {
  ResetPasswordFailureState({required this.errorData});
  final ResponseException errorData;
}

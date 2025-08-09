import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class ForgetPasswordEmailState {}

final class ForgetPasswordEmailInitial extends ForgetPasswordEmailState {}

final class EnableAutoValidateModeState extends ForgetPasswordEmailState {}

final class SendEmailVerificationSuccessState extends ForgetPasswordEmailState {
  SendEmailVerificationSuccessState({required this.info});
  final String? info;
}

final class SendEmailVerificationFailureState extends ForgetPasswordEmailState {
  SendEmailVerificationFailureState({required this.errorData});
  final ResponseException errorData;
}

final class SendEmailVerificationLoadingState
    extends ForgetPasswordEmailState {}

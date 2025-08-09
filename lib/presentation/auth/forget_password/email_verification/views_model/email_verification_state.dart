import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class EmailVerificationState {}

final class EmailVerificationInitial extends EmailVerificationState {}

final class OtpValidationErrorState extends EmailVerificationState {}

final class OTPValidationSuccessState extends EmailVerificationState {}

final class OTPValidationLoadingState extends EmailVerificationState {}

final class OTPValidationFailureState extends EmailVerificationState {
  OTPValidationFailureState({required this.errorData});
  final ResponseException errorData;
}

final class ResendCodeSuccessState extends EmailVerificationState {
  ResendCodeSuccessState({required this.info});
  final String? info;
}

final class ResendCodeLoadingState extends EmailVerificationState {}

final class ResendCodeFailureState extends EmailVerificationState {
  ResendCodeFailureState({required this.errorData});
  final ResponseException errorData;
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/core/constants/const_keys.dart';
import 'package:exam_app/domain/use_cases/forget_password/send_email_verification_use_case.dart';
import 'package:exam_app/domain/use_cases/forget_password/verify_email_use_case.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_state.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:exam_app/utils/validations.dart';

@injectable
class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final VerifyEmailUseCase verifyEmailUseCase;
  @factoryMethod
  EmailVerificationCubit({
    required this.sendEmailVerificationUseCase,
    required this.verifyEmailUseCase,
  }) : super(EmailVerificationInitial());
  String? otpValidationValue;
  String otpValue = "";

  void onOtpValueChange({required String value}) {
    otpValue = value;
    if (otpValidationValue != null) {
      otpValidationValue = Validations.otpValidation(code: value);
      emit(OtpValidationErrorState());
    }
  }

  Future<void> continueToResetPassword() async {
    if (otpValue.isEmpty || otpValue.length < 6) {
      otpValidationValue = Validations.otpValidation(code: otpValue);
      emit(OtpValidationErrorState());
    } else {
      emit(OTPValidationLoadingState());
      if (isClosed) return;
      var status = await verifyEmailUseCase.invoke(code: otpValue);
      switch (status) {
        case Success<String?>():
          {
            if (status.data?.toLowerCase() == ConstKeys.success) {
              emit(OTPValidationSuccessState());
            }
          }
          break;
        case Failure<String?>():
          emit(
            OTPValidationFailureState(
              errorData:
                  status.responseException ??
                  ResponseException(code: 0, message: status.errorMessage),
            ),
          );
          break;
      }
    }
  }

  Future<void> resendVerificationCode({required String userEmail}) async {
    emit(ResendCodeLoadingState());
    var info = await sendEmailVerificationUseCase.invoke(email: userEmail);
    switch (info) {
      case Success<String?>():
        emit(ResendCodeSuccessState(info: info.data));
        break;
      case Failure<String?>():
        emit(
          ResendCodeFailureState(
            errorData:
                info.responseException ??
                ResponseException(code: 0, message: info.errorMessage),
          ),
        );
        break;
    }
  }
}

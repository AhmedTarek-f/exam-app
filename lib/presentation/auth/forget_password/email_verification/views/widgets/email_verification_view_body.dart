import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/core/router/route_names.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views/widgets/otp_validation_field.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views/widgets/resend_code.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views/widgets/verification_continue_button.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_state.dart';
import 'package:exam_app/utils/loaders/loaders.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key, required this.userEmail});
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is ResendCodeFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is ResendCodeSuccessState) {
          Loaders.showSuccessMessage(
            message: state.info ?? AppText.emailVerificationMessage,
            context: context,
          );
        } else if (state is OTPValidationFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is OTPValidationSuccessState) {
          Navigator.of(context).pushReplacementNamed(
            RouteNames.resetPassword,
            arguments: userEmail,
          );
        }
      },
      child: SingleChildScrollView(
        child: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RSizedBox(height: 32),
              Text(
                AppText.emailVerification,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const RSizedBox(height: 16),
              RSizedBox(
                width: 273,
                child: Text(
                  AppText.emailVerificationMessage2,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const RSizedBox(height: 32),
              const OtpVerificationField(),
              const RSizedBox(height: 24),
              ResendCode(userEmail: userEmail),
              const RSizedBox(height: 48),
              const VerificationContinueButton(),
            ],
          ),
        ),
      ),
    );
  }
}

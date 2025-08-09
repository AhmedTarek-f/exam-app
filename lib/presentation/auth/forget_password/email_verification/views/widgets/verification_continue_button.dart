import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/common_widgets/custom_elevated_button.dart';
import 'package:exam_app/core/common_widgets/loading_button.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_state.dart';

class VerificationContinueButton extends StatelessWidget {
  const VerificationContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<EmailVerificationCubit>(context);
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      buildWhen: (previous, current) =>
          current is OTPValidationLoadingState ||
          current is OtpValidationErrorState ||
          current is OTPValidationFailureState ||
          current is ResendCodeLoadingState,
      builder: (context, state) => state is OTPValidationLoadingState
          ? const LoadingButton()
          : CustomElevatedButton(
              onPressed: state is ResendCodeLoadingState
                  ? () {}
                  : () async {
                      await controller.continueToResetPassword();
                    },
              buttonTitle: AppText.continueText,
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/common_widgets/custom_elevated_button.dart';
import 'package:exam_app/core/common_widgets/loading_button.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views_model/forget_password_email_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views_model/forget_password_email_state.dart';

class EmailContinueButton extends StatelessWidget {
  const EmailContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ForgetPasswordEmailCubit>(context);
    return BlocBuilder<ForgetPasswordEmailCubit, ForgetPasswordEmailState>(
      buildWhen: (previous, current) =>
          current is SendEmailVerificationLoadingState ||
          current is SendEmailVerificationFailureState,
      builder: (context, state) => state is SendEmailVerificationLoadingState
          ? const LoadingButton()
          : CustomElevatedButton(
              onPressed: () async {
                await controller.sendEmailValidation();
              },
              buttonTitle: AppText.continueText,
            ),
    );
  }
}

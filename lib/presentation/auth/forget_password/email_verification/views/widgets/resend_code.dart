import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/common_widgets/loading_circle.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_state.dart';

class ResendCode extends StatelessWidget {
  const ResendCode({super.key, required this.userEmail});
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<EmailVerificationCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              AppText.didNotReceiveCode,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
          buildWhen: (previous, current) =>
              current is ResendCodeLoadingState ||
              current is OTPValidationLoadingState ||
              current is ResendCodeSuccessState ||
              current is ResendCodeFailureState,
          builder: (context, state) => state is ResendCodeLoadingState
              ? RPadding(
                  padding: const EdgeInsets.all(4),
                  child: LoadingCircle(
                    circleColor: Theme.of(context).colorScheme.primary,
                  ),
                )
              : InkWell(
                  onTap: state is OTPValidationLoadingState
                      ? () {}
                      : () async {
                          await controller.resendVerificationCode(
                            userEmail: userEmail,
                          );
                        },
                  borderRadius: BorderRadius.circular(30.r),
                  highlightColor: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.2),
                  splashColor: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.2),
                  child: RPadding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      AppText.resend,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

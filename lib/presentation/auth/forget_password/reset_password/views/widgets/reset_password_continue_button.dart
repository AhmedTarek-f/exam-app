import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/common_widgets/custom_elevated_button.dart';
import 'package:exam_app/core/common_widgets/loading_button.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views_model/reset_password_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views_model/reset_password_state.dart';

class ResetPasswordContinueButton extends StatelessWidget {
  const ResetPasswordContinueButton({super.key, required this.userEmail});
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ResetPasswordCubit>(context);
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      buildWhen: (previous, current) =>
          current is ResetPasswordLoadingState ||
          current is ResetPasswordFailureState,
      builder: (context, state) => state is ResetPasswordLoadingState
          ? const LoadingButton()
          : CustomElevatedButton(
              onPressed: () async {
                await controller.resetPassword(email: userEmail);
              },
              buttonTitle: AppText.continueText,
            ),
    );
  }
}

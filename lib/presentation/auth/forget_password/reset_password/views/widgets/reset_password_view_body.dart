import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views/widgets/reset_password_continue_button.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views/widgets/reset_password_form.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views_model/reset_password_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views_model/reset_password_state.dart';
import 'package:exam_app/utils/loaders/loaders.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key, required this.userEmail});
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is ResetPasswordSuccessState) {
          Navigator.of(context).pop();
          Loaders.showSuccessMessage(
            message: AppText.resetPasswordSuccess,
            context: context,
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
                AppText.resetPassword,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const RSizedBox(height: 16),
              RSizedBox(
                width: 273,
                child: Text(
                  AppText.resetPasswordMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const RSizedBox(height: 32),
              const ChangePasswordForm(),
              const RSizedBox(height: 48),
              ResetPasswordContinueButton(userEmail: userEmail),
            ],
          ),
        ),
      ),
    );
  }
}

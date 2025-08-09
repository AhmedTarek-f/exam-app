import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/core/router/route_names.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views/widgets/email_continue_button.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views/widgets/email_field.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views_model/forget_password_email_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views_model/forget_password_email_state.dart';
import 'package:exam_app/utils/loaders/loaders.dart';

class ForgetPasswordEmailViewBody extends StatelessWidget {
  const ForgetPasswordEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ForgetPasswordEmailCubit>(context);
    return BlocListener<ForgetPasswordEmailCubit, ForgetPasswordEmailState>(
      listener: (context, state) {
        if (state is SendEmailVerificationFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is SendEmailVerificationSuccessState) {
          Navigator.of(context).pushReplacementNamed(
            RouteNames.emailVerification,
            arguments: controller.emailController.text.trim(),
          );
          Loaders.showSuccessMessage(
            message: state.info ?? AppText.emailVerificationMessage,
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
                AppText.forgetPassword2,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const RSizedBox(height: 16),
              RSizedBox(
                width: 273,
                child: Text(
                  AppText.forgetPasswordMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const RSizedBox(height: 32),
              const EmailField(),
              const RSizedBox(height: 48),
              const EmailContinueButton(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/common_widgets/custom_text_form_field.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views_model/forget_password_email_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views_model/forget_password_email_state.dart';
import 'package:exam_app/utils/validations.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ForgetPasswordEmailCubit>(context);

    return BlocBuilder<ForgetPasswordEmailCubit, ForgetPasswordEmailState>(
      buildWhen: (previous, current) =>
          current is EnableAutoValidateModeState ||
          current is SendEmailVerificationLoadingState ||
          current is SendEmailVerificationFailureState,
      builder: (context, state) => Form(
        key: controller.forgetPasswordFormKey,
        autovalidateMode: controller.autoValidateMode,
        child: CustomTextFormField(
          controller: controller.emailController,
          label: AppText.email,
          hintText: AppText.emailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          validator: (value) => Validations.emailValidation(email: value),
          enabled: state is! SendEmailVerificationLoadingState,
        ),
      ),
    );
  }
}

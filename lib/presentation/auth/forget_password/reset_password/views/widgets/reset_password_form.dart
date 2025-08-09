import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/common_widgets/custom_text_form_field.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views_model/reset_password_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views_model/reset_password_state.dart';
import 'package:exam_app/utils/validations.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ResetPasswordCubit>(context);
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      buildWhen: (previous, current) => current is EnableAutoValidateModeState,
      builder: (context, state) => Form(
        key: controller.changePasswordFormKey,
        autovalidateMode: controller.autoValidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              buildWhen: (previous, current) =>
                  current is ChangeNewPasswordObscureState ||
                  current is ResetPasswordLoadingState,
              builder: (context, state) => CustomTextFormField(
                label: AppText.newPassword,
                controller: controller.newPasswordController,
                hintText: AppText.newPasswordHint,
                validator: (value) =>
                    Validations.passwordValidation(password: value),
                obscuringCharacter: "*",
                maxLines: 1,
                obscureText: controller.isPasswordObscure,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.toggleNewPasswordObscure();
                  },
                  icon: Icon(
                    controller.isPasswordObscure
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 22.r,
                  ),
                ),
                // enabled: !controller.isLoading,
              ),
            ),
            const RSizedBox(height: 24),
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              buildWhen: (previous, current) =>
                  current is ChangeConfirmNewPasswordObscureState ||
                  current is ResetPasswordLoadingState,
              builder: (context, state) => CustomTextFormField(
                label: AppText.confirmPassword,
                controller: controller.confirmNewPasswordController,
                hintText: AppText.confirmPassword,
                validator: (value) => Validations.confirmPasswordValidation(
                  conformPassword: value,
                  password: controller.newPasswordController.text,
                ),
                obscuringCharacter: "*",
                maxLines: 1,
                obscureText: controller.isConfirmPasswordObscure,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.toggleConfirmNewPasswordObscure();
                  },
                  icon: Icon(
                    controller.isConfirmPasswordObscure
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 22.r,
                  ),
                ),
                // enabled: !controller.isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

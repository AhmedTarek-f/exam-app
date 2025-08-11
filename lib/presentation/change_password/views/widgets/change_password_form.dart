import 'package:exam_app/core/common_widgets/custom_text_form_field.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_cubit.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_intent.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_state.dart';
import 'package:exam_app/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ChangePasswordCubit>(context);
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      buildWhen: (previous, current) =>
          current is EnableAutoValidateModeState ||
          current is ChangeConfirmNewPasswordObscureState ||
          current is ChangeCurrentPasswordObscureState ||
          current is ChangeNewPasswordObscureState ||
          current is ChangePasswordLoadingState ||
          current is ChangePasswordFailureState,
      builder: (context, state) => Form(
        key: controller.changePasswordFormKey,
        autovalidateMode: (state is EnableAutoValidateModeState
            ? state.autoValidateMode
            : AutovalidateMode.disabled),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
              buildWhen: (previous, current) =>
                  current is ChangeCurrentPasswordObscureState ||
                  current is ChangePasswordLoadingState ||
                  current is ChangePasswordFailureState,
              builder: (context, state) => CustomTextFormField(
                label: AppText.currentPassword,
                controller: controller.currentPasswordController,
                hintText: AppText.currentPassword,
                validator: (value) =>
                    Validations.passwordValidation(password: value),
                obscuringCharacter: "*",
                maxLines: 1,
                obscureText: (state is ChangeCurrentPasswordObscureState
                    ? state.isObscure
                    : true),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.doIntent(
                      intent: ToggleCurrentPasswordObscureIntent(),
                    );
                  },
                  icon: Icon(
                    (state is ChangeCurrentPasswordObscureState
                            ? state.isObscure
                            : true)
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 22.r,
                  ),
                ),
                enabled: state is! ChangePasswordLoadingState,
              ),
            ),
            const RSizedBox(height: 24),
            BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
              buildWhen: (previous, current) =>
                  current is ChangeNewPasswordObscureState ||
                  current is ChangePasswordLoadingState ||
                  current is ChangePasswordFailureState,
              builder: (context, state) => CustomTextFormField(
                label: AppText.newPassword,
                controller: controller.newPasswordController,
                hintText: AppText.newPasswordHint,
                validator: (value) =>
                    Validations.passwordValidation(password: value),
                obscuringCharacter: "*",
                maxLines: 1,
                obscureText: (state is ChangeNewPasswordObscureState
                    ? state.isObscure
                    : true),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.doIntent(
                      intent: ToggleNewPasswordObscureIntent(),
                    );
                  },
                  icon: Icon(
                    (state is ChangeNewPasswordObscureState
                            ? state.isObscure
                            : true)
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 22.r,
                  ),
                ),
                enabled: state is! ChangePasswordLoadingState,
              ),
            ),
            const RSizedBox(height: 24),
            BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
              buildWhen: (previous, current) =>
                  current is ChangeConfirmNewPasswordObscureState ||
                  current is ChangePasswordLoadingState ||
                  current is ChangePasswordFailureState,
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
                obscureText: (state is ChangeConfirmNewPasswordObscureState
                    ? state.isObscureConfirm
                    : true),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.doIntent(
                      intent: ToggleConfirmNewPasswordObscureIntent(),
                    );
                  },
                  icon: Icon(
                    (state is ChangeConfirmNewPasswordObscureState
                            ? state.isObscureConfirm
                            : true)
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 22.r,
                  ),
                ),
                enabled: state is! ChangePasswordLoadingState,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:exam_app/core/common_widgets/custom_text_form_field.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/core/router/route_names.dart';
import 'package:exam_app/presentation/auth/signup/views/widgets/signup_button.dart';
import 'package:exam_app/presentation/auth/signup/views_model/sign_up_intent.dart';
import 'package:exam_app/presentation/auth/signup/views_model/signup_cubit.dart';
import 'package:exam_app/utils/loaders/loaders.dart';
import 'package:exam_app/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpFailureState || current is SignUpSuccessState,
      listener: (context, state) {
        if (state is SignUpFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is SignUpSuccessState) {
          Navigator.of(
            context,
          ).pushReplacementNamed(RouteNames.homeBottomNavigation);
        }
      },
      buildWhen: (previous, current) =>
          current is EnableAutoValidateModeState ||
          current is SignUpLoadingState ||
          current is SignUpFailureState ||
          current is ChangeConfirmPasswordObscureState ||
          current is ChangePasswordObscureState,
      builder: (context, state) => Form(
        key: controller.signupFormKey,
        autovalidateMode: state is EnableAutoValidateModeState
            ? state.autoValidateMode
            : AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: controller.userNameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              label: AppText.userName,
              hintText: AppText.userNameHint,
              validator: (value) => Validations.userNameValidation(name: value),
              enabled: state is! SignUpLoadingState,
            ),
            const RSizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: controller.firstNameController,
                    textInputAction: TextInputAction.next,
                    label: AppText.firstName,
                    hintText: AppText.firstNameHint,
                    validator: (value) => Validations.validateEmptyText(value),
                    enabled: state is! SignUpLoadingState,
                  ),
                ),
                const SizedBox(width: 17),
                Expanded(
                  child: CustomTextFormField(
                    controller: controller.lastNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    label: AppText.lastName,
                    hintText: AppText.lastNameHint,
                    validator: (value) => Validations.validateEmptyText(value),
                    enabled: state is! SignUpLoadingState,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              controller: controller.emailController,
              textInputAction: TextInputAction.next,
              label: AppText.email,
              keyboardType: TextInputType.emailAddress,
              hintText: AppText.emailHint,
              validator: (value) => Validations.emailValidation(email: value),
              enabled: state is! SignUpLoadingState,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: BlocBuilder<SignUpCubit, SignUpState>(
                    buildWhen: (previous, current) =>
                        current is ChangePasswordObscureState,
                    builder: (context, state) => CustomTextFormField(
                      controller: controller.passwordController,
                      label: AppText.password,
                      hintText: AppText.passwordHint,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.doIntent(
                            intent: ToggleObscurePasswordIntent(),
                          );
                        },
                        icon: Icon(
                          (state is ChangePasswordObscureState
                                  ? state.isObscure
                                  : true)
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).colorScheme.onSecondary,
                          size: 22.r,
                        ),
                      ),
                      obscuringCharacter: "*",
                      obscureText: (state is ChangePasswordObscureState
                          ? state.isObscure
                          : true),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          Validations.passwordValidation(password: value),
                      enabled: state is! SignUpLoadingState,
                    ),
                  ),
                ),
                const RSizedBox(width: 17),
                Expanded(
                  child: BlocBuilder<SignUpCubit, SignUpState>(
                    buildWhen: (previous, current) =>
                        current is ChangeConfirmPasswordObscureState,
                    builder: (context, state) => CustomTextFormField(
                      controller: controller.rePasswordController,
                      label: AppText.password,
                      hintText: AppText.passwordHint,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.doIntent(
                            intent: ToggleConfirmObscurePasswordIntent(),
                          );
                        },
                        icon: Icon(
                          (state is ChangeConfirmPasswordObscureState
                                  ? state.isObscureConfirm
                                  : true)
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).colorScheme.onSecondary,
                          size: 22.r,
                        ),
                      ),
                      obscuringCharacter: "*",
                      obscureText: (state is ChangeConfirmPasswordObscureState
                          ? state.isObscureConfirm
                          : true),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          Validations.confirmPasswordValidation(
                            password: controller.passwordController.text,
                            conformPassword: value,
                          ),
                      enabled: state is! SignUpLoadingState,
                    ),
                  ),
                ),
              ],
            ),
            const RSizedBox(height: 24),
            CustomTextFormField(
              controller: controller.phoneController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              label: AppText.phoneNumber,
              hintText: AppText.phoneNumberHint,
              validator: (value) =>
                  Validations.phoneValidation(phoneNumber: value),
              enabled: state is! SignUpLoadingState,
            ),
            const RSizedBox(height: 48),
            const SignupButton(),
            const RSizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.alreadyHaveAccount,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, RouteNames.login),
                  child: Text(
                    AppText.login,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

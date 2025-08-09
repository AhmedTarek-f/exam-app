import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/common_widgets/custom_text_form_field.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_cubit.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_state.dart';
import 'package:exam_app/utils/validations.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<EditProfileCubit>(context);
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (previous, current) =>
          current is EnableAutoValidateModeState ||
          current is EditProfileLoadingState ||
          current is EditProfileFailureState,
      builder: (context, state) => Form(
        key: controller.editProfileFormKey,
        autovalidateMode: controller.autoValidateMode,
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
              enabled: state is! EditProfileLoadingState,
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
                    enabled: state is! EditProfileLoadingState,
                  ),
                ),
                const RSizedBox(width: 17),
                Expanded(
                  child: CustomTextFormField(
                    controller: controller.lastNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    label: AppText.lastName,
                    hintText: AppText.lastNameHint,
                    validator: (value) => Validations.validateEmptyText(value),
                    enabled: state is! EditProfileLoadingState,
                  ),
                ),
              ],
            ),
            const RSizedBox(height: 24),
            CustomTextFormField(
              controller: controller.emailController,
              textInputAction: TextInputAction.next,
              label: AppText.email,
              keyboardType: TextInputType.emailAddress,
              hintText: AppText.emailHint,
              validator: (value) => Validations.emailValidation(email: value),
              enabled: state is! EditProfileLoadingState,
            ),
            const RSizedBox(height: 24),
            GestureDetector(
              onTap: state is! EditProfileLoadingState
                  ? () {
                      debugPrint("Navigate To Change Password Screen");
                    }
                  : () {},
              child: CustomTextFormField(
                controller: controller.passwordController,
                label: AppText.password,
                suffixIcon: Padding(
                  padding: REdgeInsetsDirectional.only(end: 8),
                  child: Text(
                    AppText.change,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),

                enabled: false,
              ),
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
              enabled: state is! EditProfileLoadingState,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:exam_app/core/common_widgets/custom_text_form_field.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/profile/views_model/profile_cubit.dart';
import 'package:exam_app/presentation/profile/views_model/profile_intent.dart';
import 'package:exam_app/presentation/profile/views_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ProfileCubit>(context);
    final theme = Theme.of(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => current is UpdatedProfileDataState,
      builder: (context, state) => Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: controller.userNameController,
              label: AppText.userName,
              enabled: false,
            ),
            const RSizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: controller.firstNameController,
                    label: AppText.firstName,
                    enabled: false,
                  ),
                ),
                const RSizedBox(width: 17),
                Expanded(
                  child: CustomTextFormField(
                    controller: controller.lastNameController,
                    label: AppText.lastName,
                    enabled: false,
                  ),
                ),
              ],
            ),
            const RSizedBox(height: 24),
            CustomTextFormField(
              controller: controller.emailController,
              label: AppText.email,
              enabled: false,
            ),
            const RSizedBox(height: 24),
            GestureDetector(
              onTap: () {
                controller.doIntent(intent: NavigateToChangePasswordIntent());
              },
              child: CustomTextFormField(
                controller: controller.passwordController,
                label: AppText.password,
                suffixIcon: Padding(
                  padding: REdgeInsetsDirectional.only(end: 8),
                  child: Text(
                    AppText.change,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                enabled: false,
              ),
            ),
            const RSizedBox(height: 24),
            CustomTextFormField(
              controller: controller.phoneController,
              label: AppText.phoneNumber,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/edit_profile/views/widgets/edit_profile_button.dart';
import 'package:exam_app/presentation/edit_profile/views/widgets/edit_profile_form.dart';
import 'package:exam_app/presentation/edit_profile/views/widgets/edit_profile_image.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_cubit.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_state.dart';
import 'package:exam_app/presentation/profile/views_model/profile_cubit.dart';
import 'package:exam_app/presentation/profile/views_model/profile_intent.dart';
import 'package:exam_app/utils/loaders/loaders.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key, required this.profileController});
  final ProfileCubit profileController;
  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is EditProfileSuccessState) {
          Navigator.of(context).pop();
          profileController.doIntent(intent: UpdateProfileDataIntent());
          Loaders.showSuccessMessage(
            message: AppText.editProfileSuccessMessage,
            context: context,
          );
        }
      },
      child: const SingleChildScrollView(
        child: RPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              RSizedBox(height: 24),
              EditProfileImage(),
              RSizedBox(height: 24),
              EditProfileForm(),
              RSizedBox(height: 48),
              EditProfileButton(),
              RSizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/router/route_names.dart';
import 'package:exam_app/presentation/profile/views/widgets/logout_button.dart';
import 'package:exam_app/presentation/profile/views/widgets/profile_form.dart';
import 'package:exam_app/presentation/profile/views/widgets/profile_image.dart';
import 'package:exam_app/presentation/profile/views/widgets/update_profile_button.dart';
import 'package:exam_app/presentation/profile/views_model/profile_cubit.dart';
import 'package:exam_app/presentation/profile/views_model/profile_state.dart';
import 'package:exam_app/utils/loaders/loaders.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is LogoutSuccessState) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
        }
      },
      child: const SingleChildScrollView(
        child: RPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              RSizedBox(height: 24),
              ProfileImage(),
              RSizedBox(height: 24),
              ProfileForm(),
              RSizedBox(height: 48),
              UpdateProfileButton(),
              RSizedBox(height: 16),
              LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

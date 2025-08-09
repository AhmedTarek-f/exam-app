import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/common_widgets/custom_elevated_button.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/core/router/route_names.dart';
import 'package:exam_app/presentation/profile/views_model/profile_cubit.dart';
import 'package:exam_app/presentation/profile/views_model/profile_state.dart';

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is LogoutLoadingState || current is LogoutFailureState,
      builder: (context, state) => CustomElevatedButton(
        onPressed: state is LogoutLoadingState
            ? () {}
            : () {
                Navigator.of(
                  context,
                ).pushNamed(RouteNames.editProfile, arguments: controller);
              },
        buttonTitle: AppText.update,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/common_widgets/custom_elevated_button.dart';
import 'package:exam_app/core/common_widgets/loading_button.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_cubit.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_intent.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_state.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<EditProfileCubit>(context);
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (previous, current) =>
          current is EditProfileLoadingState ||
          current is EditProfileFailureState,
      builder: (context, state) => state is EditProfileLoadingState
          ? const LoadingButton()
          : CustomElevatedButton(
              onPressed: () async {
                await controller.doIntent(intent: UpdateProfileIntent());
              },
              buttonTitle: AppText.update,
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/common_widgets/custom_elevated_button.dart';
import 'package:exam_app/core/common_widgets/loading_button.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/profile/views_model/profile_cubit.dart';
import 'package:exam_app/presentation/profile/views_model/profile_intent.dart';
import 'package:exam_app/presentation/profile/views_model/profile_state.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ProfileCubit>(context);
    final theme = Theme.of(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is LogoutLoadingState || current is LogoutFailureState,
      builder: (context, state) => state is LogoutLoadingState
          ? LoadingButton(backgroundColor: theme.colorScheme.primaryContainer)
          : CustomElevatedButton(
              onPressed: () async {
                await controller.doIntent(intent: LogoutIntent());
              },
              buttonTitle: AppText.logout,
              backgroundColor: theme.colorScheme.primaryContainer,
            ),
    );
  }
}

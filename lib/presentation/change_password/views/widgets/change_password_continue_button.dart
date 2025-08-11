import 'package:exam_app/core/common_widgets/custom_elevated_button.dart';
import 'package:exam_app/core/common_widgets/loading_button.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_cubit.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_intent.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordContinueButton extends StatelessWidget {
  const ChangePasswordContinueButton({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ChangePasswordCubit>(context);
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      buildWhen: (previous, current) =>
          current is ChangePasswordLoadingState ||
          current is ChangePasswordFailureState,
      builder: (context, state) => state is ChangePasswordLoadingState
          ? const LoadingButton()
          : CustomElevatedButton(
              onPressed: () async {
                await controller.doIntent(
                  intent: ChangePasswordPressedIntent(),
                );
              },
              buttonTitle: AppText.update,
            ),
    );
  }
}

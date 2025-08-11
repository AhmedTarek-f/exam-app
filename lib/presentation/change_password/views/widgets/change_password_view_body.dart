import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/change_password/views/widgets/change_password_continue_button.dart';
import 'package:exam_app/presentation/change_password/views/widgets/change_password_form.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_cubit.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_state.dart';
import 'package:exam_app/utils/loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is ChangePasswordSuccessState) {
          Navigator.of(context).pop();
          Loaders.showSuccessMessage(
            message: AppText.resetPasswordSuccess,
            context: context,
          );
        }
      },
      child: const SingleChildScrollView(
        child: RPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RSizedBox(height: 32),
              ChangePasswordForm(),
              RSizedBox(height: 54),
              ChangePasswordContinueButton(),
            ],
          ),
        ),
      ),
    );
  }
}

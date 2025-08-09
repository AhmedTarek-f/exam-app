import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views/widgets/reset_password_app_bar.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views/widgets/reset_password_view_body.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views_model/reset_password_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.userEmail});
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
      create: (context) => getIt.get<ResetPasswordCubit>(),
      child: Scaffold(
        appBar: const ResetPasswordAppBar(),
        body: ResetPasswordViewBody(userEmail: userEmail),
      ),
    );
  }
}

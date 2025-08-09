import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views/widgets/forget_password_email_app_bar.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views/widgets/forget_password_email_view_body.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views_model/forget_password_email_cubit.dart';

class ForgetPasswordEmailView extends StatelessWidget {
  const ForgetPasswordEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordEmailCubit>(
      create: (context) => getIt.get<ForgetPasswordEmailCubit>(),
      child: const Scaffold(
        appBar: ForgetPasswordEmailAppBar(),
        body: ForgetPasswordEmailViewBody(),
      ),
    );
  }
}

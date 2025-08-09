import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views/widgets/email_verification_app_bar.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views/widgets/email_verification_view_body.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_cubit.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key, required this.userEmail});
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailVerificationCubit>(
      create: (context) => getIt.get<EmailVerificationCubit>(),
      child: Scaffold(
        appBar: const EmailVerificationAppBar(),
        body: EmailVerificationViewBody(userEmail: userEmail),
      ),
    );
  }
}

import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/presentation/change_password/views/widgets/change_password_app_bar.dart';
import 'package:exam_app/presentation/change_password/views/widgets/change_password_view_body.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_cubit.dart';
import 'package:exam_app/presentation/change_password/views_model/change_password_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordCubit>(
      create: (context) =>
          getIt.get<ChangePasswordCubit>()
            ..doIntent(intent: InitializeChangePasswordIntent()),
      child: const Scaffold(
        appBar: ChangePasswordAppBar(),
        body: ChangePasswordViewBody(),
      ),
    );
  }
}

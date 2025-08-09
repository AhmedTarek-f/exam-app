import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/presentation/edit_profile/views/widgets/edit_profile_app_bar.dart';
import 'package:exam_app/presentation/edit_profile/views/widgets/edit_profile_view_body.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_cubit.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_intent.dart';
import 'package:exam_app/presentation/profile/views_model/profile_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.profileController});
  final ProfileCubit profileController;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>(
      create: (context) =>
          getIt.get<EditProfileCubit>()
            ..doIntent(intent: EditProfileInitializeDataIntent()),
      child: Scaffold(
        appBar: const EditProfileAppBar(),
        body: EditProfileViewBody(profileController: profileController),
      ),
    );
  }
}

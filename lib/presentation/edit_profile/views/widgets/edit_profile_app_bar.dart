import 'package:flutter/material.dart';
import 'package:exam_app/core/common_widgets/custom_app_bar.dart';
import 'package:exam_app/core/common_widgets/custom_back_arrow.dart';
import 'package:exam_app/core/constants/app_text.dart';

class EditProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      leading: CustomBackArrow(),
      title: AppText.editProfile,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

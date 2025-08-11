import 'package:exam_app/core/common_widgets/custom_app_bar.dart';
import 'package:exam_app/core/common_widgets/custom_back_arrow.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:flutter/material.dart';

class ChangePasswordAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChangePasswordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      leading: CustomBackArrow(),
      title: AppText.resetPassword,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

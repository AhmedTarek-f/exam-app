import 'package:flutter/material.dart';
import 'package:exam_app/core/common_widgets/custom_app_bar.dart';
import 'package:exam_app/core/common_widgets/custom_back_arrow.dart';
import 'package:exam_app/core/constants/app_text.dart';

class ForgetPasswordEmailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ForgetPasswordEmailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      leading: CustomBackArrow(),
      title: AppText.forgetPassword2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

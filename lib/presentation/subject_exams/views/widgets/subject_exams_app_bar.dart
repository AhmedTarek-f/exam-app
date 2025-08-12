import 'package:exam_app/core/common_widgets/custom_app_bar.dart';
import 'package:exam_app/core/common_widgets/custom_back_arrow.dart';
import 'package:flutter/material.dart';

class SubjectExamsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SubjectExamsAppBar({super.key, required this.subjectTitle});
  final String subjectTitle;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(leading: const CustomBackArrow(), title: subjectTitle);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

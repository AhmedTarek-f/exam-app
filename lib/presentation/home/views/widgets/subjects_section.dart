import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/home/views/widgets/subjects_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectsSection extends StatelessWidget {
  const SubjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppText.browseBySubject, style: theme.textTheme.labelMedium),
        const RSizedBox(height: 24),
        const SubjectsList(),
      ],
    );
  }
}

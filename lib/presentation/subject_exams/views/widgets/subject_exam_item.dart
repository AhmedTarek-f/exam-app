import 'package:exam_app/core/constants/app_images.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/domain/entities/subject_exams/subject_exam_entity.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_cubit.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectExamItem extends StatelessWidget {
  const SubjectExamItem({super.key, required this.examData});
  final SubjectExamEntity examData;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<SubjectExamsCubit>(context);
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        controller.doIntent(intent: StartExamIntent());
      },
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
        margin: REdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: theme.colorScheme.secondary,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSecondary.withValues(alpha: 0.4),
              blurStyle: BlurStyle.outer,
              blurRadius: 4.r,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.examBoard,
                    width: 60.w,
                    height: 71.h,
                    fit: BoxFit.cover,
                  ),
                  const RSizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          examData.examTitle,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSecondary,
                          ),
                        ),
                      ),
                      const RSizedBox(height: 4),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${examData.examNumberOfQuestions.toString()} ${AppText.question}",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.shadow,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "${examData.examDuration.toString()} ${AppText.minutes}",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

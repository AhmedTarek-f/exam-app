import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_app/core/common_widgets/shimmer_effect.dart';
import 'package:exam_app/domain/entities/home/subject_entity.dart';
import 'package:exam_app/presentation/home/views_model/home_cubit.dart';
import 'package:exam_app/presentation/home/views_model/home_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key, required this.subjectData});
  final SubjectEntity subjectData;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        controller.doIntent(
          intent: NavigateToSubjectExamsIntent(subjectData: subjectData),
        );
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 48.r,
              height: 48.r,
              imageUrl: subjectData.subjectIcon,
              progressIndicatorBuilder: (context, url, progress) =>
                  ShimmerEffect(width: 48.r, height: 48.r),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline),
            ),
            const RSizedBox(width: 8),
            Text(
              subjectData.subjectTitle,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

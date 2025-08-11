import 'package:exam_app/core/common_widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectShimmerItem extends StatelessWidget {
  const SubjectShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: ScreenUtil().screenWidth,
      height: 80.h,
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
      child: ShimmerEffect(width: ScreenUtil().screenWidth, height: 80.h),
    );
  }
}

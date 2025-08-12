import 'package:exam_app/presentation/subject_exams/views/widgets/shimmer/subject_exam_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectExamsShimmerList extends StatelessWidget {
  const SubjectExamsShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.separated(
        itemBuilder: (_, __) => const SubjectExamShimmerItem(),
        separatorBuilder: (_, __) => const RSizedBox(height: 16),
        itemCount: 20,
      ),
    );
  }
}

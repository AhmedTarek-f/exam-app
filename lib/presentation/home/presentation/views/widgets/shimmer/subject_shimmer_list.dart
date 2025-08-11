import 'package:exam_app/presentation/home/presentation/views/widgets/shimmer/subject_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectShimmerList extends StatelessWidget {
  const SubjectShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 480,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const SubjectShimmerItem(),
        separatorBuilder: (context, index) => const RSizedBox(height: 16),
        itemCount: 20,
      ),
    );
  }
}

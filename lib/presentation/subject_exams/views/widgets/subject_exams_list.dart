import 'package:exam_app/core/constants/app_animations.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/subject_exams/views/widgets/shimmer/subject_exams_shimmer_list.dart';
import 'package:exam_app/presentation/subject_exams/views/widgets/subject_exam_item.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_cubit.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_state.dart';
import 'package:exam_app/utils/loaders/animation_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectExamsList extends StatelessWidget {
  const SubjectExamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectExamsCubit, SubjectExamsState>(
      buildWhen: (previous, current) =>
          current is FetchSubjectExamsLoadingState ||
          current is FetchSubjectExamsSuccessState,
      builder: (BuildContext context, SubjectExamsState state) {
        if (state is FetchSubjectExamsSuccessState) {
          return SliverPadding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            sliver: state.subjectExams.isEmpty
                ? const SliverToBoxAdapter(
                    child: AnimationLoaderWidget(
                      text: AppText.emptyExamsMessage,
                      animation: AppAnimations.emptyFile,
                    ),
                  )
                : SliverList.separated(
                    itemBuilder: (_, index) =>
                        SubjectExamItem(examData: state.subjectExams[index]),
                    separatorBuilder: (_, __) => const RSizedBox(height: 16),
                    itemCount: state.subjectExams.length,
                  ),
          );
        } else {
          return const SubjectExamsShimmerList();
        }
      },
    );
  }
}

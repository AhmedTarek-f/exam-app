import 'package:exam_app/core/constants/app_animations.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/home/views/widgets/shimmer/subject_shimmer_list.dart';
import 'package:exam_app/presentation/home/views/widgets/subject_item.dart';
import 'package:exam_app/presentation/home/views_model/home_cubit.dart';
import 'package:exam_app/presentation/home/views_model/home_state.dart';
import 'package:exam_app/utils/loaders/animation_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectsList extends StatelessWidget {
  const SubjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is FetchSubjectsLoadingState ||
          current is FetchSubjectsSuccessState,
      builder: (BuildContext context, HomeState state) {
        if (state is FetchSubjectsSuccessState) {
          return SliverPadding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            sliver: state.subjects.isEmpty
                ? const SliverToBoxAdapter(
                    child: AnimationLoaderWidget(
                      text: AppText.emptySubjectsMessage,
                      animation: AppAnimations.emptyFile,
                    ),
                  )
                : SliverList.separated(
                    itemBuilder: (_, index) =>
                        SubjectItem(subjectData: state.subjects[index]),
                    separatorBuilder: (_, __) => const RSizedBox(height: 16),
                    itemCount: state.subjects.length,
                  ),
          );
        } else {
          return const SubjectShimmerList();
        }
      },
    );
  }
}

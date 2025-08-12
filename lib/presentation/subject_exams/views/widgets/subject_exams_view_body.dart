import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/subject_exams/views/widgets/subject_exams_list.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_cubit.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_state.dart';
import 'package:exam_app/utils/dialogs/dialogs.dart';
import 'package:exam_app/utils/loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectExamsViewBody extends StatelessWidget {
  const SubjectExamsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<SubjectExamsCubit, SubjectExamsState>(
      listenWhen: (previous, current) =>
          current is FetchSubjectExamsFailureState || current is StartExamState,
      listener: (context, state) {
        if (state is FetchSubjectExamsFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is StartExamState) {
          Dialogs.startQuiz(context: context, onStart: () {});
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RSizedBox(height: 40),
                RPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppText.exams,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                const RSizedBox(height: 24),
              ],
            ),
          ),
          const SubjectExamsList(),
        ],
      ),
    );
  }
}

import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/domain/entities/home/subject_entity.dart';
import 'package:exam_app/presentation/subject_exams/views/widgets/subject_exams_app_bar.dart';
import 'package:exam_app/presentation/subject_exams/views/widgets/subject_exams_view_body.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_cubit.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectExamsView extends StatelessWidget {
  const SubjectExamsView({super.key, required this.subjectData});
  final SubjectEntity subjectData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubjectExamsCubit>(
      create: (context) => getIt.get<SubjectExamsCubit>()
        ..doIntent(
          intent: GetAllSubjectExamsIntent(subjectId: subjectData.subjectId),
        ),
      child: Scaffold(
        appBar: SubjectExamsAppBar(subjectTitle: subjectData.subjectTitle),
        body: const SubjectExamsViewBody(),
      ),
    );
  }
}

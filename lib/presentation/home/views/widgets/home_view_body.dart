import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/home/views/widgets/home_search_field.dart';
import 'package:exam_app/presentation/home/views/widgets/subjects_section.dart';
import 'package:exam_app/presentation/home/views_model/home_cubit.dart';
import 'package:exam_app/presentation/home/views_model/home_state.dart';
import 'package:exam_app/utils/loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => current is FetchSubjectsFailureState,
      listener: (context, state) {
        if (state is FetchSubjectsFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        }
      },
      child: SingleChildScrollView(
        child: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.survey,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  letterSpacing: 0.05.sp,
                ),
              ),
              const RSizedBox(height: 16),
              const HomeSearchField(),
              const RSizedBox(height: 40),
              const SubjectsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

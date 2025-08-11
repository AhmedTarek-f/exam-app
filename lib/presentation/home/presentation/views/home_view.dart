import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/presentation/home/presentation/views/widgets/home_view_body.dart';
import 'package:exam_app/presentation/home/presentation/views_model/home_cubit.dart';
import 'package:exam_app/presentation/home/presentation/views_model/home_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) =>
          getIt.get<HomeCubit>()..doIntent(intent: GetAllSubjectsIntent()),
      child: const SafeArea(child: HomeViewBody()),
    );
  }
}

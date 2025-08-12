import 'package:exam_app/presentation/home_bottom_navigation/views/widgets/home_bottom_navigation_bar.dart';
import 'package:exam_app/presentation/home_bottom_navigation/views_model/home_bottom_navigation_cubit.dart';
import 'package:exam_app/presentation/home_bottom_navigation/views_model/home_bottom_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomNavigationView extends StatelessWidget {
  const HomeBottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeBottomNavigationCubit>(context);
    return Scaffold(
      bottomNavigationBar: const HomeBottomNavigationBar(),
      body: BlocBuilder<HomeBottomNavigationCubit, HomeBottomNavigationState>(
        builder: (context, state) => controller.menuTaps[controller.tapIndex],
      ),
    );
  }
}

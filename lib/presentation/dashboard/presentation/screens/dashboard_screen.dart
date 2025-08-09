import 'package:flutter/material.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/presentation/dashboard/domain/controllers/home_controller.dart';
import 'package:exam_app/presentation/dashboard/presentation/cubits/home_cubit.dart';
import 'package:exam_app/presentation/profile/views/profile_view.dart';

import 'home_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<HomeCubit>();
    final controller = getIt<HomeController>();

    return StreamBuilder<HomeState>(
      stream: cubit.stream,
      initialData: cubit.state,
      builder: (context, snapshot) {
        final currentIndex = controller.currentIndex;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              _getTitle(currentIndex),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: _getTab(currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: controller.onTabSelected,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Results',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _getTab(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Center(child: Text('Results'));
      case 2:
        return const ProfileView();
      default:
        return const SizedBox.shrink();
    }
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Results';
      case 2:
        return 'Profile';
      default:
        return '';
    }
  }
}

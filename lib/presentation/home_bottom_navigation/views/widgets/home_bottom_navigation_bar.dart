import 'package:exam_app/core/constants/app_colors.dart';
import 'package:exam_app/core/constants/app_icons.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/home_bottom_navigation/views/widgets/build_nav_item.dart';
import 'package:exam_app/presentation/home_bottom_navigation/views_model/home_bottom_navigation_cubit.dart';
import 'package:exam_app/presentation/home_bottom_navigation/views_model/home_bottom_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeBottomNavigationCubit>(context);
    return BlocBuilder<HomeBottomNavigationCubit, HomeBottomNavigationState>(
      builder: (context, state) => Container(
        padding: REdgeInsets.only(bottom: 8),
        color: AppColors.lightBlue,
        height: 68.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildNavItem(
              label: AppText.explore,
              icon: AppIcons.homeBarIcon,
              index: 0,
              currentIndex: controller.tapIndex,
              onTap: () => controller.changeIndex(0),
            ),
            BuildNavItem(
              label: AppText.result,
              icon: AppIcons.resultsBarIcon,
              index: 1,
              currentIndex: controller.tapIndex,
              onTap: () => controller.changeIndex(1),
            ),
            BuildNavItem(
              label: AppText.profile,
              icon: AppIcons.profileBarIcon,
              index: 2,
              currentIndex: controller.tapIndex,
              onTap: () => controller.changeIndex(2),
            ),
          ],
        ),
      ),
    );
  }
}

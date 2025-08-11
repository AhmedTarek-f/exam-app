import 'package:exam_app/presentation/home/presentation/views/home_view.dart';
import 'package:exam_app/presentation/home_bottom_navigation/presentation/views_model/home_bottom_navigation_state.dart';
import 'package:exam_app/presentation/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomNavigationCubit extends Cubit<HomeBottomNavigationState> {
  HomeBottomNavigationCubit() : super(HomeBottomNavigationInitial());
  int tapIndex = 0;
  final List<Widget> menuTaps = const [
    HomeView(),
    Center(child: Text("Result Screen")),
    ProfileView(),
  ];
  void changeIndex(int index) {
    if (tapIndex != index) {
      tapIndex = index;
      emit(ChangeHomeBottomNavigationIndexState());
    }
  }
}

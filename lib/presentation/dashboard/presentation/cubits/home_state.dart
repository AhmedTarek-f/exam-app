part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeTabChanged extends HomeState {
  final int index;

  HomeTabChanged(this.index);
}

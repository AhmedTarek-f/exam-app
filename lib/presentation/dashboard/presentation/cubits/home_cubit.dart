import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  HomeCubit() : super(HomeInitial());

  void changeTab(int index) {
    _currentIndex = index;
    emit(HomeTabChanged(index));
  }
}

import 'package:injectable/injectable.dart';

import '../../presentation/cubits/home_cubit.dart';

@injectable
class HomeController {
  final HomeCubit homeCubit;

  HomeController(this.homeCubit);

  void onTabSelected(int index) {
    homeCubit.changeTab(index);
  }

  int get currentIndex => homeCubit.currentIndex;
}

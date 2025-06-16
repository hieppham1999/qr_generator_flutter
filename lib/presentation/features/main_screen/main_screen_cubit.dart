import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/base/base_cubit.dart';
import 'package:qr_generator_flutter/presentation/features/main_screen/main_screen_state.dart';

@singleton
class MainScreenCubit extends BaseCubit<MainScreenState> {
  MainScreenCubit() : super.normal(MainScreenState());

  void init() {
    print("Init");
  }

  void updateTabIndex(int index) {
    emitNormal(currentData.copyWith(pageIndex: index));
  }
}

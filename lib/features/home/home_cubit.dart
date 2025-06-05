import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/base/base_cubit.dart';
import 'package:qr_generator_flutter/features/home/home_state.dart';

@singleton
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super.normal(HomeState());

  void init() {
    print("Init");
  }

  void updateTabIndex(int index) {
    emitNormal(currentData.copyWith(pageIndex: index));
  }
}

import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/base/base_cubit.dart';
import 'package:qr_generator_flutter/data/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/features/home/home_state.dart';

@singleton
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super.loading(HomeState());

  // HomeState get _state => state as HomeState;

  QrModel qrData = QrModel();

  void init() {
    print("Init");
  }

  void updateQrData(String data) {
    if (data.isNotEmpty) {
      qrData = qrData.copyWith(content: data);
      emitNormal();
    } else {
      emitError("Not a valid text");
    }
  }

  void updateQrModuleColor(Color color) {
    qrData = qrData.copyWith(moduleStyle: qrData.moduleStyle.copyWith(color: color));
    emitNormal();
  }

  void updateQrEyeColor(Color color) {
    qrData = qrData.copyWith(eyeStyle: qrData.eyeStyle.copyWith(color: color));
    emitNormal();
  }

  void updateTabIndex(int index) {
    emitNormal(currentData.copyWith(pageIndex: index));
  }
}

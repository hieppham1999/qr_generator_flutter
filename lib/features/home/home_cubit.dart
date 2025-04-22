import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/data/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/data/app_state.dart';

@singleton
class HomeCubit extends Cubit<CubitState> {
  HomeCubit() : super(NormalState());

  QrModel qrData = QrModel();

  void init() {
    print("Init");
  }

  void updateQrData(String data) {
    if (data.isNotEmpty) {
      qrData = qrData.copyWith(content: data);
      emit(NormalState());
    } else {
      emit(ErrorState(message: "Not a valid text"));
    }
  }

  void updateQrColor(Color color) {
    qrData = qrData.copyWith(moduleStyle: qrData.moduleStyle.copyWith(color: color));
    // qrData = qrData.copyWith(moduleStyle: qrData.moduleStyle.copyWith(color: color));
    emit(NormalState());
  }
}

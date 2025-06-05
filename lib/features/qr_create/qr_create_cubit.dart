import 'dart:ui';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/base/base_cubit.dart';
import 'package:qr_generator_flutter/data/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/features/qr_create/qr_create_state.dart';

class QrCreateCubit extends BaseCubit<QrCreateState> {
  QrCreateCubit() : super.loading(QrCreateState());

  void updateQrData(String data) {
    if (data.isNotEmpty) {
      emitNormal(
        currentData.copyWith(
          qrModel: currentData.qrModel.copyWith(content: data),
        ),
      );
    } else {
      emitError("Not a valid text");
    }
  }

  void updateQrModule({QrDataModuleShape? shape, Color? color}) {
    emitNormal(
      currentData.copyWith(
        qrModel: currentData.qrModel.copyWith(
          moduleStyle: currentData.qrModel.moduleStyle.copyWith(
            shape: shape,
            color: color,
          ),
        ),
      ),
    );
  }

  void updateQrEyeColor({QrEyeShape? shape, Color? color}) {
    emitNormal(
      currentData.copyWith(
        qrModel: currentData.qrModel.copyWith(
          eyeStyle: currentData.qrModel.eyeStyle.copyWith(
            color: color,
            shape: shape,
          ),
        ),
      ),
    );
  }
}

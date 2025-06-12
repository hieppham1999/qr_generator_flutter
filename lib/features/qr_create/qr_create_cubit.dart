import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/base/base_cubit.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/features/qr_create/qr_create_state.dart';

@injectable
class QrCreateCubit extends BaseCubit<QrCreateState> {
  QrCreateCubit() : super.normal(QrCreateState.df());

  void updateQrData(String data) {
    if (data.isNotEmpty) {
      currentData.qrModel.content = data;

      emitNormal(currentData);
      // emitNormal(
      //   currentData.copyWith(
      //     qrModel: currentData.qrModel.copyWith(content: data),
      //   ),
      // );
    } else {
      emitError("Not a valid text");
    }
  }

  void updateQrStyle(QrModel model) {
    emitNormal(
      currentData.copyWith(
          qrModel: QrModel.copyWithStyle(currentData.qrModel, model)),
    );
  }

  void resetQrStyle() {
    emitNormal(
      currentData.copyWith(qrModel: QrModel.defaultStyle(currentData.qrModel)),
    );
  }

  void saveQr() {

  }
}

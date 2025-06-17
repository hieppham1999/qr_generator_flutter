import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/base/base_cubit.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/data/repository/qr_repositories.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/presentation/features/qr_create/qr_create_state.dart';
import 'package:qr_generator_flutter/utils/app_logger.dart';
import 'package:qr_generator_flutter/utils/snackbar.dart';

@injectable
class QrCreateCubit extends BaseCubit<QrCreateState> {
  QrCreateCubit(this._repository) : super.normal(QrCreateState.df());

  final QrRepository _repository;

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

  Future<bool> saveQr() async {
    try {
      _repository.saveQr(currentData.qrModel);
      showSnackBar(NavigatorKey.key.currentContext!,
          message: "Qr Saved");
      return true;
    } on Exception catch (e) {
      appLogger.e(e.toString());

      showSnackBar(NavigatorKey.key.currentContext!,
          message: "Error while saving qr code");
      return false;
    }
  }
}

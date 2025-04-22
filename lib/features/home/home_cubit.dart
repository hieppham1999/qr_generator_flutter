import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/app_state.dart';

@singleton
class HomeCubit extends Cubit<CubitState> {
  HomeCubit() : super(NormalState(null));

  String qrData = '';

  void init() {
    print("Init");
  }

  void updateQrData(String data) {
    if (data.isNotEmpty) {
      qrData = data;
      emit(NormalState(null));
    } else {
      emit(ErrorState(message: "Not a valid text"));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../app_state.dart';

@singleton
class HomeCubit extends Cubit<CubitState> {
  HomeCubit() : super(NormalState());

  String qrData = '';

  void init() {
    print("Init");
  }

  void updateQrData(String data) {
    qrData = data;
    emit(NormalState());
  }
}

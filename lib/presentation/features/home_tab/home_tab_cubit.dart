import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/base/base_cubit.dart';
import 'package:qr_generator_flutter/data/repository/qr_repositories.dart';
import 'package:qr_generator_flutter/presentation/features/home_tab/home_tab_state.dart';

@injectable
class HomeTabCubit extends BaseCubit<HomeTabState> {
  HomeTabCubit(this._repository) : super.normal(HomeTabState());

  final QrRepository _repository;

  void init() {
    loadQrList();
  }

  Future<void> loadQrList() async {
    final qrList = await _repository.getAllQrs();

    emitNormal(currentData.copyWith(listQr: qrList));
  }
}

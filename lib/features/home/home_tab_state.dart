import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator_flutter/presentation/viewmodels/qr_view_data.dart';

part 'home_tab_state.freezed.dart';

@freezed
abstract class HomeTabState with _$HomeTabState {
  factory HomeTabState({@Default([]) List<QrViewData> listQr}) = _HomeTabState;
}

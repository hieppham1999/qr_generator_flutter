import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_screen_state.freezed.dart';

@freezed
abstract class MainScreenState with _$MainScreenState {
  factory MainScreenState({@Default(0) int pageIndex}) = _MainScreenState;
}

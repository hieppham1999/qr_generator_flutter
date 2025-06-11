// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QrScanState {

 List<QrScanResult> get scanResult;
/// Create a copy of QrScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrScanStateCopyWith<QrScanState> get copyWith => _$QrScanStateCopyWithImpl<QrScanState>(this as QrScanState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrScanState&&const DeepCollectionEquality().equals(other.scanResult, scanResult));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(scanResult));

@override
String toString() {
  return 'QrScanState(scanResult: $scanResult)';
}


}

/// @nodoc
abstract mixin class $QrScanStateCopyWith<$Res>  {
  factory $QrScanStateCopyWith(QrScanState value, $Res Function(QrScanState) _then) = _$QrScanStateCopyWithImpl;
@useResult
$Res call({
 List<QrScanResult> scanResult
});




}
/// @nodoc
class _$QrScanStateCopyWithImpl<$Res>
    implements $QrScanStateCopyWith<$Res> {
  _$QrScanStateCopyWithImpl(this._self, this._then);

  final QrScanState _self;
  final $Res Function(QrScanState) _then;

/// Create a copy of QrScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scanResult = null,}) {
  return _then(_self.copyWith(
scanResult: null == scanResult ? _self.scanResult : scanResult // ignore: cast_nullable_to_non_nullable
as List<QrScanResult>,
  ));
}

}


/// @nodoc


class _QrScanState implements QrScanState {
  const _QrScanState({final  List<QrScanResult> scanResult = const []}): _scanResult = scanResult;
  

 final  List<QrScanResult> _scanResult;
@override@JsonKey() List<QrScanResult> get scanResult {
  if (_scanResult is EqualUnmodifiableListView) return _scanResult;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanResult);
}


/// Create a copy of QrScanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrScanStateCopyWith<_QrScanState> get copyWith => __$QrScanStateCopyWithImpl<_QrScanState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrScanState&&const DeepCollectionEquality().equals(other._scanResult, _scanResult));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_scanResult));

@override
String toString() {
  return 'QrScanState(scanResult: $scanResult)';
}


}

/// @nodoc
abstract mixin class _$QrScanStateCopyWith<$Res> implements $QrScanStateCopyWith<$Res> {
  factory _$QrScanStateCopyWith(_QrScanState value, $Res Function(_QrScanState) _then) = __$QrScanStateCopyWithImpl;
@override @useResult
$Res call({
 List<QrScanResult> scanResult
});




}
/// @nodoc
class __$QrScanStateCopyWithImpl<$Res>
    implements _$QrScanStateCopyWith<$Res> {
  __$QrScanStateCopyWithImpl(this._self, this._then);

  final _QrScanState _self;
  final $Res Function(_QrScanState) _then;

/// Create a copy of QrScanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scanResult = null,}) {
  return _then(_QrScanState(
scanResult: null == scanResult ? _self._scanResult : scanResult // ignore: cast_nullable_to_non_nullable
as List<QrScanResult>,
  ));
}


}

// dart format on

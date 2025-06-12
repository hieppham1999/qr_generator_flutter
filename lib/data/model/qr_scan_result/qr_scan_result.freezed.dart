// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QrScanResult implements DiagnosticableTreeMixin {

 Uint8List? get image; Barcode get barcode;
/// Create a copy of QrScanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrScanResultCopyWith<QrScanResult> get copyWith => _$QrScanResultCopyWithImpl<QrScanResult>(this as QrScanResult, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QrScanResult'))
    ..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('barcode', barcode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrScanResult&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.barcode, barcode) || other.barcode == barcode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(image),barcode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QrScanResult(image: $image, barcode: $barcode)';
}


}

/// @nodoc
abstract mixin class $QrScanResultCopyWith<$Res>  {
  factory $QrScanResultCopyWith(QrScanResult value, $Res Function(QrScanResult) _then) = _$QrScanResultCopyWithImpl;
@useResult
$Res call({
 Uint8List? image, Barcode barcode
});




}
/// @nodoc
class _$QrScanResultCopyWithImpl<$Res>
    implements $QrScanResultCopyWith<$Res> {
  _$QrScanResultCopyWithImpl(this._self, this._then);

  final QrScanResult _self;
  final $Res Function(QrScanResult) _then;

/// Create a copy of QrScanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = freezed,Object? barcode = null,}) {
  return _then(_self.copyWith(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as Barcode,
  ));
}

}


/// @nodoc


class _QrScanResult with DiagnosticableTreeMixin implements QrScanResult {
  const _QrScanResult({this.image = null, required this.barcode});
  

@override@JsonKey() final  Uint8List? image;
@override final  Barcode barcode;

/// Create a copy of QrScanResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrScanResultCopyWith<_QrScanResult> get copyWith => __$QrScanResultCopyWithImpl<_QrScanResult>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QrScanResult'))
    ..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('barcode', barcode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrScanResult&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.barcode, barcode) || other.barcode == barcode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(image),barcode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QrScanResult(image: $image, barcode: $barcode)';
}


}

/// @nodoc
abstract mixin class _$QrScanResultCopyWith<$Res> implements $QrScanResultCopyWith<$Res> {
  factory _$QrScanResultCopyWith(_QrScanResult value, $Res Function(_QrScanResult) _then) = __$QrScanResultCopyWithImpl;
@override @useResult
$Res call({
 Uint8List? image, Barcode barcode
});




}
/// @nodoc
class __$QrScanResultCopyWithImpl<$Res>
    implements _$QrScanResultCopyWith<$Res> {
  __$QrScanResultCopyWithImpl(this._self, this._then);

  final _QrScanResult _self;
  final $Res Function(_QrScanResult) _then;

/// Create a copy of QrScanResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = freezed,Object? barcode = null,}) {
  return _then(_QrScanResult(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as Barcode,
  ));
}


}

// dart format on

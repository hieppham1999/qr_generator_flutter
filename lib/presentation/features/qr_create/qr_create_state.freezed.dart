// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_create_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QrCreateState {

 String? get id; QrModel get qrModel;
/// Create a copy of QrCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrCreateStateCopyWith<QrCreateState> get copyWith => _$QrCreateStateCopyWithImpl<QrCreateState>(this as QrCreateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrCreateState&&(identical(other.id, id) || other.id == id)&&(identical(other.qrModel, qrModel) || other.qrModel == qrModel));
}


@override
int get hashCode => Object.hash(runtimeType,id,qrModel);

@override
String toString() {
  return 'QrCreateState(id: $id, qrModel: $qrModel)';
}


}

/// @nodoc
abstract mixin class $QrCreateStateCopyWith<$Res>  {
  factory $QrCreateStateCopyWith(QrCreateState value, $Res Function(QrCreateState) _then) = _$QrCreateStateCopyWithImpl;
@useResult
$Res call({
 String? id, QrModel qrModel
});


$QrModelCopyWith<$Res> get qrModel;

}
/// @nodoc
class _$QrCreateStateCopyWithImpl<$Res>
    implements $QrCreateStateCopyWith<$Res> {
  _$QrCreateStateCopyWithImpl(this._self, this._then);

  final QrCreateState _self;
  final $Res Function(QrCreateState) _then;

/// Create a copy of QrCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? qrModel = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,qrModel: null == qrModel ? _self.qrModel : qrModel // ignore: cast_nullable_to_non_nullable
as QrModel,
  ));
}
/// Create a copy of QrCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrModelCopyWith<$Res> get qrModel {
  
  return $QrModelCopyWith<$Res>(_self.qrModel, (value) {
    return _then(_self.copyWith(qrModel: value));
  });
}
}


/// @nodoc


class _QrCreateState implements QrCreateState {
   _QrCreateState({this.id, required this.qrModel});
  

@override final  String? id;
@override final  QrModel qrModel;

/// Create a copy of QrCreateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrCreateStateCopyWith<_QrCreateState> get copyWith => __$QrCreateStateCopyWithImpl<_QrCreateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrCreateState&&(identical(other.id, id) || other.id == id)&&(identical(other.qrModel, qrModel) || other.qrModel == qrModel));
}


@override
int get hashCode => Object.hash(runtimeType,id,qrModel);

@override
String toString() {
  return 'QrCreateState(id: $id, qrModel: $qrModel)';
}


}

/// @nodoc
abstract mixin class _$QrCreateStateCopyWith<$Res> implements $QrCreateStateCopyWith<$Res> {
  factory _$QrCreateStateCopyWith(_QrCreateState value, $Res Function(_QrCreateState) _then) = __$QrCreateStateCopyWithImpl;
@override @useResult
$Res call({
 String? id, QrModel qrModel
});


@override $QrModelCopyWith<$Res> get qrModel;

}
/// @nodoc
class __$QrCreateStateCopyWithImpl<$Res>
    implements _$QrCreateStateCopyWith<$Res> {
  __$QrCreateStateCopyWithImpl(this._self, this._then);

  final _QrCreateState _self;
  final $Res Function(_QrCreateState) _then;

/// Create a copy of QrCreateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? qrModel = null,}) {
  return _then(_QrCreateState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,qrModel: null == qrModel ? _self.qrModel : qrModel // ignore: cast_nullable_to_non_nullable
as QrModel,
  ));
}

/// Create a copy of QrCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrModelCopyWith<$Res> get qrModel {
  
  return $QrModelCopyWith<$Res>(_self.qrModel, (value) {
    return _then(_self.copyWith(qrModel: value));
  });
}
}

// dart format on

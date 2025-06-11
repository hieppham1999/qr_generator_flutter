// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CubitState<T> {

 T get data;
/// Create a copy of CubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CubitStateCopyWith<T, CubitState<T>> get copyWith => _$CubitStateCopyWithImpl<T, CubitState<T>>(this as CubitState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CubitState<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CubitState<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class $CubitStateCopyWith<T,$Res>  {
  factory $CubitStateCopyWith(CubitState<T> value, $Res Function(CubitState<T>) _then) = _$CubitStateCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$CubitStateCopyWithImpl<T,$Res>
    implements $CubitStateCopyWith<T, $Res> {
  _$CubitStateCopyWithImpl(this._self, this._then);

  final CubitState<T> _self;
  final $Res Function(CubitState<T>) _then;

/// Create a copy of CubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// @nodoc


class NormalState<T> implements CubitState<T> {
  const NormalState(this.data);
  

@override final  T data;

/// Create a copy of CubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NormalStateCopyWith<T, NormalState<T>> get copyWith => _$NormalStateCopyWithImpl<T, NormalState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NormalState<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CubitState<$T>.normal(data: $data)';
}


}

/// @nodoc
abstract mixin class $NormalStateCopyWith<T,$Res> implements $CubitStateCopyWith<T, $Res> {
  factory $NormalStateCopyWith(NormalState<T> value, $Res Function(NormalState<T>) _then) = _$NormalStateCopyWithImpl;
@override @useResult
$Res call({
 T data
});




}
/// @nodoc
class _$NormalStateCopyWithImpl<T,$Res>
    implements $NormalStateCopyWith<T, $Res> {
  _$NormalStateCopyWithImpl(this._self, this._then);

  final NormalState<T> _self;
  final $Res Function(NormalState<T>) _then;

/// Create a copy of CubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(NormalState<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class LoadingState<T> implements CubitState<T> {
  const LoadingState(this.data);
  

@override final  T data;

/// Create a copy of CubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingStateCopyWith<T, LoadingState<T>> get copyWith => _$LoadingStateCopyWithImpl<T, LoadingState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CubitState<$T>.loading(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoadingStateCopyWith<T,$Res> implements $CubitStateCopyWith<T, $Res> {
  factory $LoadingStateCopyWith(LoadingState<T> value, $Res Function(LoadingState<T>) _then) = _$LoadingStateCopyWithImpl;
@override @useResult
$Res call({
 T data
});




}
/// @nodoc
class _$LoadingStateCopyWithImpl<T,$Res>
    implements $LoadingStateCopyWith<T, $Res> {
  _$LoadingStateCopyWithImpl(this._self, this._then);

  final LoadingState<T> _self;
  final $Res Function(LoadingState<T>) _then;

/// Create a copy of CubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(LoadingState<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ErrorState<T> implements CubitState<T> {
  const ErrorState({required this.message, required this.data});
  

 final  String message;
@override final  T data;

/// Create a copy of CubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<T, ErrorState<T>> get copyWith => _$ErrorStateCopyWithImpl<T, ErrorState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState<T>&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CubitState<$T>.error(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<T,$Res> implements $CubitStateCopyWith<T, $Res> {
  factory $ErrorStateCopyWith(ErrorState<T> value, $Res Function(ErrorState<T>) _then) = _$ErrorStateCopyWithImpl;
@override @useResult
$Res call({
 String message, T data
});




}
/// @nodoc
class _$ErrorStateCopyWithImpl<T,$Res>
    implements $ErrorStateCopyWith<T, $Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState<T> _self;
  final $Res Function(ErrorState<T>) _then;

/// Create a copy of CubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(ErrorState<T>(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on

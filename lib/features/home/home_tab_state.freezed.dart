// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeTabState {

 List<QrViewData> get listQr;
/// Create a copy of HomeTabState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeTabStateCopyWith<HomeTabState> get copyWith => _$HomeTabStateCopyWithImpl<HomeTabState>(this as HomeTabState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTabState&&const DeepCollectionEquality().equals(other.listQr, listQr));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(listQr));

@override
String toString() {
  return 'HomeTabState(listQr: $listQr)';
}


}

/// @nodoc
abstract mixin class $HomeTabStateCopyWith<$Res>  {
  factory $HomeTabStateCopyWith(HomeTabState value, $Res Function(HomeTabState) _then) = _$HomeTabStateCopyWithImpl;
@useResult
$Res call({
 List<QrViewData> listQr
});




}
/// @nodoc
class _$HomeTabStateCopyWithImpl<$Res>
    implements $HomeTabStateCopyWith<$Res> {
  _$HomeTabStateCopyWithImpl(this._self, this._then);

  final HomeTabState _self;
  final $Res Function(HomeTabState) _then;

/// Create a copy of HomeTabState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listQr = null,}) {
  return _then(_self.copyWith(
listQr: null == listQr ? _self.listQr : listQr // ignore: cast_nullable_to_non_nullable
as List<QrViewData>,
  ));
}

}


/// @nodoc


class _HomeTabState implements HomeTabState {
   _HomeTabState({final  List<QrViewData> listQr = const []}): _listQr = listQr;
  

 final  List<QrViewData> _listQr;
@override@JsonKey() List<QrViewData> get listQr {
  if (_listQr is EqualUnmodifiableListView) return _listQr;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listQr);
}


/// Create a copy of HomeTabState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeTabStateCopyWith<_HomeTabState> get copyWith => __$HomeTabStateCopyWithImpl<_HomeTabState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeTabState&&const DeepCollectionEquality().equals(other._listQr, _listQr));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_listQr));

@override
String toString() {
  return 'HomeTabState(listQr: $listQr)';
}


}

/// @nodoc
abstract mixin class _$HomeTabStateCopyWith<$Res> implements $HomeTabStateCopyWith<$Res> {
  factory _$HomeTabStateCopyWith(_HomeTabState value, $Res Function(_HomeTabState) _then) = __$HomeTabStateCopyWithImpl;
@override @useResult
$Res call({
 List<QrViewData> listQr
});




}
/// @nodoc
class __$HomeTabStateCopyWithImpl<$Res>
    implements _$HomeTabStateCopyWith<$Res> {
  __$HomeTabStateCopyWithImpl(this._self, this._then);

  final _HomeTabState _self;
  final $Res Function(_HomeTabState) _then;

/// Create a copy of HomeTabState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listQr = null,}) {
  return _then(_HomeTabState(
listQr: null == listQr ? _self._listQr : listQr // ignore: cast_nullable_to_non_nullable
as List<QrViewData>,
  ));
}


}

// dart format on

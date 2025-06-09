// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QrModel {

 String? get content; int get versions; QrEyeStyle get eyeStyle; QrDataModuleStyle get moduleStyle; Color get backgroundColor; int get version;
/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrModelCopyWith<QrModel> get copyWith => _$QrModelCopyWithImpl<QrModel>(this as QrModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrModel&&(identical(other.content, content) || other.content == content)&&(identical(other.versions, versions) || other.versions == versions)&&(identical(other.eyeStyle, eyeStyle) || other.eyeStyle == eyeStyle)&&(identical(other.moduleStyle, moduleStyle) || other.moduleStyle == moduleStyle)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,content,versions,eyeStyle,moduleStyle,backgroundColor,version);

@override
String toString() {
  return 'QrModel(content: $content, versions: $versions, eyeStyle: $eyeStyle, moduleStyle: $moduleStyle, backgroundColor: $backgroundColor, version: $version)';
}


}

/// @nodoc
abstract mixin class $QrModelCopyWith<$Res>  {
  factory $QrModelCopyWith(QrModel value, $Res Function(QrModel) _then) = _$QrModelCopyWithImpl;
@useResult
$Res call({
 String? content, int versions, QrEyeStyle eyeStyle, QrDataModuleStyle moduleStyle, Color backgroundColor, int version
});




}
/// @nodoc
class _$QrModelCopyWithImpl<$Res>
    implements $QrModelCopyWith<$Res> {
  _$QrModelCopyWithImpl(this._self, this._then);

  final QrModel _self;
  final $Res Function(QrModel) _then;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = freezed,Object? versions = null,Object? eyeStyle = null,Object? moduleStyle = null,Object? backgroundColor = null,Object? version = null,}) {
  return _then(_self.copyWith(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as int,eyeStyle: null == eyeStyle ? _self.eyeStyle : eyeStyle // ignore: cast_nullable_to_non_nullable
as QrEyeStyle,moduleStyle: null == moduleStyle ? _self.moduleStyle : moduleStyle // ignore: cast_nullable_to_non_nullable
as QrDataModuleStyle,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _QrModel implements QrModel {
  const _QrModel({this.content, this.versions = -1, this.eyeStyle = _defaultEyeStyle, this.moduleStyle = _defaultModuleStyle, this.backgroundColor = Colors.black, this.version = -1});
  

@override final  String? content;
@override@JsonKey() final  int versions;
@override@JsonKey() final  QrEyeStyle eyeStyle;
@override@JsonKey() final  QrDataModuleStyle moduleStyle;
@override@JsonKey() final  Color backgroundColor;
@override@JsonKey() final  int version;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrModelCopyWith<_QrModel> get copyWith => __$QrModelCopyWithImpl<_QrModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrModel&&(identical(other.content, content) || other.content == content)&&(identical(other.versions, versions) || other.versions == versions)&&(identical(other.eyeStyle, eyeStyle) || other.eyeStyle == eyeStyle)&&(identical(other.moduleStyle, moduleStyle) || other.moduleStyle == moduleStyle)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,content,versions,eyeStyle,moduleStyle,backgroundColor,version);

@override
String toString() {
  return 'QrModel(content: $content, versions: $versions, eyeStyle: $eyeStyle, moduleStyle: $moduleStyle, backgroundColor: $backgroundColor, version: $version)';
}


}

/// @nodoc
abstract mixin class _$QrModelCopyWith<$Res> implements $QrModelCopyWith<$Res> {
  factory _$QrModelCopyWith(_QrModel value, $Res Function(_QrModel) _then) = __$QrModelCopyWithImpl;
@override @useResult
$Res call({
 String? content, int versions, QrEyeStyle eyeStyle, QrDataModuleStyle moduleStyle, Color backgroundColor, int version
});




}
/// @nodoc
class __$QrModelCopyWithImpl<$Res>
    implements _$QrModelCopyWith<$Res> {
  __$QrModelCopyWithImpl(this._self, this._then);

  final _QrModel _self;
  final $Res Function(_QrModel) _then;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = freezed,Object? versions = null,Object? eyeStyle = null,Object? moduleStyle = null,Object? backgroundColor = null,Object? version = null,}) {
  return _then(_QrModel(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as int,eyeStyle: null == eyeStyle ? _self.eyeStyle : eyeStyle // ignore: cast_nullable_to_non_nullable
as QrEyeStyle,moduleStyle: null == moduleStyle ? _self.moduleStyle : moduleStyle // ignore: cast_nullable_to_non_nullable
as QrDataModuleStyle,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

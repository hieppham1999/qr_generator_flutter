// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettings {

 Locale get locale; ThemeMode get themeMode; Color get colorSchemeSeed; bool get notificationsEnabled;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.colorSchemeSeed, colorSchemeSeed) || other.colorSchemeSeed == colorSchemeSeed)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,locale,themeMode,colorSchemeSeed,notificationsEnabled);

@override
String toString() {
  return 'AppSettings(locale: $locale, themeMode: $themeMode, colorSchemeSeed: $colorSchemeSeed, notificationsEnabled: $notificationsEnabled)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 Locale locale, ThemeMode themeMode, Color colorSchemeSeed, bool notificationsEnabled
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,Object? themeMode = null,Object? colorSchemeSeed = null,Object? notificationsEnabled = null,}) {
  return _then(AppSettings(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,colorSchemeSeed: null == colorSchemeSeed ? _self.colorSchemeSeed : colorSchemeSeed // ignore: cast_nullable_to_non_nullable
as Color,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on

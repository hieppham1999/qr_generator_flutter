// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrModel _$QrModelFromJson(Map<String, dynamic> json) => _QrModel(
  content: json['content'] as String?,
  versions: (json['versions'] as num?)?.toInt() ?? -1,
  eyeStyle:
      json['eyeStyle'] == null
          ? _defaultEyeStyle
          : MyQrEyeStyle.fromJson(json['eyeStyle'] as Map<String, dynamic>),
  moduleStyle:
      json['moduleStyle'] == null
          ? _defaultModuleStyle
          : MyQrModuleStyle.fromJson(
            json['moduleStyle'] as Map<String, dynamic>,
          ),
  backgroundColor:
      json['backgroundColor'] == null
          ? Colors.blueAccent
          : const ColorConverter().fromJson(
            (json['backgroundColor'] as num).toInt(),
          ),
  version: (json['version'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$QrModelToJson(_QrModel instance) => <String, dynamic>{
  'content': instance.content,
  'versions': instance.versions,
  'eyeStyle': instance.eyeStyle,
  'moduleStyle': instance.moduleStyle,
  'backgroundColor': const ColorConverter().toJson(instance.backgroundColor),
  'version': instance.version,
};

_MyQrEyeStyle _$MyQrEyeStyleFromJson(
  Map<String, dynamic> json,
) => _MyQrEyeStyle(
  shape: $enumDecodeNullable(_$EyeTypeEnumMap, json['shape']) ?? EyeType.square,
  color:
      json['color'] == null
          ? _defaultEyeColor
          : const ColorConverter().fromJson((json['color'] as num).toInt()),
);

Map<String, dynamic> _$MyQrEyeStyleToJson(_MyQrEyeStyle instance) =>
    <String, dynamic>{
      'shape': _$EyeTypeEnumMap[instance.shape]!,
      'color': const ColorConverter().toJson(instance.color),
    };

const _$EyeTypeEnumMap = {EyeType.square: 'square', EyeType.circle: 'circle'};

_MyQrModuleStyle _$MyQrModuleStyleFromJson(Map<String, dynamic> json) =>
    _MyQrModuleStyle(
      shape:
          $enumDecodeNullable(_$ModuleTypeEnumMap, json['shape']) ??
          ModuleType.square,
      color:
          json['color'] == null
              ? _defaultModuleColor
              : const ColorConverter().fromJson((json['color'] as num).toInt()),
    );

Map<String, dynamic> _$MyQrModuleStyleToJson(_MyQrModuleStyle instance) =>
    <String, dynamic>{
      'shape': _$ModuleTypeEnumMap[instance.shape]!,
      'color': const ColorConverter().toJson(instance.color),
    };

const _$ModuleTypeEnumMap = {
  ModuleType.square: 'square',
  ModuleType.circle: 'circle',
};

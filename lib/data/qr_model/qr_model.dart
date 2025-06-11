import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/core/colors.dart';

part 'qr_model.freezed.dart';

const QrDataModuleStyle _defaultModuleStyle = QrDataModuleStyle(
  dataModuleShape: QrDataModuleShape.square,
  color: AppColors.defaultQrColor,
);

const QrEyeStyle _defaultEyeStyle = QrEyeStyle(
  eyeShape: QrEyeShape.square,
  color: AppColors.defaultQrColor,
);

@unfreezed
abstract class QrModel with _$QrModel {
  factory QrModel({
    String? content,
    @Default(-1) int versions,
    @Default(_defaultEyeStyle) QrEyeStyle eyeStyle,
    @Default(_defaultModuleStyle) QrDataModuleStyle moduleStyle,
    @Default(Colors.black) Color backgroundColor,
    @Default(-1) int version,
  }) = _QrModel;

  factory QrModel.df() => _QrModel();

  factory QrModel.copyWithStyle(QrModel model, QrModel styleFrom) =>
      styleFrom.copyWith(content: model.content);

  factory QrModel.defaultStyle(QrModel model) => QrModel(content: model.content);
}

enum ModuleType {
  square,
  circle;

  QrDataModuleShape toLibType() {
    switch (this) {
      case ModuleType.square:
        return QrDataModuleShape.square;
      case ModuleType.circle:
        return QrDataModuleShape.circle;
    }
  }

  String get displayName {
    switch (this) {
      case ModuleType.square:
        return 'Square';
      case ModuleType.circle:
        return 'Circle';
    }
  }
}

enum EyeType {
  square,
  circle;

  QrEyeShape toLibType() {
    switch (this) {
      case EyeType.square:
        return QrEyeShape.square;
      case EyeType.circle:
        return QrEyeShape.circle;
    }
  }

  String get displayName {
    switch (this) {
      case EyeType.square:
        return 'Square';
      case EyeType.circle:
        return 'Circle';
    }
  }
}

extension QrDataModuleStyleExtension on QrDataModuleStyle {
  QrDataModuleStyle copyWith({Color? color, QrDataModuleShape? shape}) {
    return QrDataModuleStyle(
      color: color ?? this.color,
      dataModuleShape: shape ?? dataModuleShape,
    );
  }

  ModuleType? toModuleType() {
    switch (dataModuleShape) {
      case QrDataModuleShape.square:
        return ModuleType.square;
      case QrDataModuleShape.circle:
        return ModuleType.circle;
      case null:
        return null;
    }
  }
}

extension QrDataEyeStyleExtension on QrEyeStyle {
  QrEyeStyle copyWith({Color? color, QrEyeShape? shape}) {
    return QrEyeStyle(color: color ?? this.color, eyeShape: shape ?? eyeShape);
  }

  EyeType? toEyeType() {
    switch (eyeShape) {
      case QrEyeShape.square:
        return EyeType.square;
      case QrEyeShape.circle:
        return EyeType.circle;
      case null:
        return null;
    }
  }
}

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

@freezed
abstract class QrModel with _$QrModel {
  const factory QrModel({
    String? content,
    @Default(-1) int versions,
    @Default(_defaultEyeStyle) QrEyeStyle eyeStyle,
    @Default(_defaultModuleStyle) QrDataModuleStyle moduleStyle,
    @Default(Colors.black) Color backgroundColor,
    @Default(-1) int version,
  }) = _QrModel;

  factory QrModel.copyWithStyle(QrModel model, QrModel styleFrom) => styleFrom.copyWith(
    content: model.content
  );

  factory QrModel.defaultStyle(QrModel model) => model.copyWith(
    eyeStyle: _defaultEyeStyle,
    moduleStyle: _defaultModuleStyle,
  );
}

extension QrDataModuleStyleExtension on QrDataModuleStyle {
  QrDataModuleStyle copyWith({Color? color, QrDataModuleShape? shape}) {
    return QrDataModuleStyle(
      color: color ?? this.color,
      dataModuleShape: shape ?? dataModuleShape,
    );
  }
}

extension QrDataEyeStyleExtension on QrEyeStyle {
  QrEyeStyle copyWith({Color? color, QrEyeShape? shape}) {
    return QrEyeStyle(
      color: color ?? this.color,
      eyeShape: shape ?? eyeShape,
    );
  }
}
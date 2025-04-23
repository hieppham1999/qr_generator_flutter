import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/core/colors.dart';

part 'qr_model.freezed.dart';

@freezed
class QrModel with _$QrModel {
  @override
  final String? content;
  @override
  final int versions;
  @override
  final QrEyeStyle eyeStyle;
  @override
  final QrDataModuleStyle moduleStyle;

  QrModel({
    this.content,
    this.versions = -1,
    this.moduleStyle = const QrDataModuleStyle(
      dataModuleShape: QrDataModuleShape.square,
      color: AppColors.defaultQrColor,
    ),
    this.eyeStyle = const QrEyeStyle(
      eyeShape: QrEyeShape.square,
      color: AppColors.defaultQrColor,
    ),
  });
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
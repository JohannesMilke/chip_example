import 'package:flutter/material.dart';

class InputChipData {
  final String label;
  final String urlAvatar;

  InputChipData({
    @required this.label,
    @required this.urlAvatar,
  });

  InputChipData copy({
    String label,
    String urlAvatar,
  }) =>
      InputChipData(
        label: label ?? this.label,
        urlAvatar: urlAvatar ?? this.urlAvatar,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InputChipData &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          urlAvatar == other.urlAvatar;

  @override
  int get hashCode => label.hashCode ^ urlAvatar.hashCode;
}

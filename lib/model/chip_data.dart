import 'package:flutter/material.dart';

class ChipData {
  final String label;
  final Color backgroundColor;

  const ChipData({
    @required this.label,
    @required this.backgroundColor,
  });

  ChipData copy({
    String label,
    Color backgroundColor,
  }) =>
      ChipData(
        label: label ?? this.label,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChipData &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          backgroundColor == other.backgroundColor;

  @override
  int get hashCode => label.hashCode ^ backgroundColor.hashCode;
}

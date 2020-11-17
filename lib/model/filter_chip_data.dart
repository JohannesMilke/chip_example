import 'package:flutter/material.dart';

class FilterChipData {
  final String label;
  final Color color;
  final bool isSelected;

  const FilterChipData({
    @required this.label,
    @required this.color,
    this.isSelected = false,
  });

  FilterChipData copy({
    String label,
    Color color,
    bool isSelected,
  }) =>
      FilterChipData(
        label: label ?? this.label,
        color: color ?? this.color,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterChipData &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          color == other.color &&
          isSelected == other.isSelected;

  @override
  int get hashCode => label.hashCode ^ color.hashCode ^ isSelected.hashCode;
}

import 'package:chip_example/model/action_chip_data.dart';
import 'package:flutter/material.dart';

class ActionChips {
  static final all = <ActionChipData>[
    ActionChipData(
      label: 'Listen Music',
      icon: Icons.music_note,
      iconColor: Colors.orange,
    ),
    ActionChipData(
      label: 'Call Adam',
      icon: Icons.call,
      iconColor: Colors.red,
    ),
    ActionChipData(
      label: 'Set Alarm',
      icon: Icons.alarm,
      iconColor: Colors.blue,
    ),
    ActionChipData(
      label: 'Hire Trainer',
      icon: Icons.directions_run,
      iconColor: Colors.purple,
    ),
    ActionChipData(
      label: 'Navigate To Work',
      icon: Icons.work,
      iconColor: Colors.pink,
    ),
    ActionChipData(
      label: 'Write Email',
      icon: Icons.alternate_email,
      iconColor: Colors.green,
    ),
  ];
}

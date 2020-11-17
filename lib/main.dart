import 'package:chip_example/data/action_chips.dart';
import 'package:chip_example/data/chips.dart';
import 'package:chip_example/data/choice_chips.dart';
import 'package:chip_example/data/filter_chips.dart';
import 'package:chip_example/data/input_chips.dart';
import 'package:chip_example/model/action_chip_data.dart';
import 'package:chip_example/model/chip_data.dart';
import 'package:chip_example/model/choice_chip_data.dart';
import 'package:chip_example/model/filter_chip_data.dart';
import 'package:chip_example/model/input_chip_data.dart';
import 'package:chip_example/utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Chip Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 3;
  final double spacing = 8;

  List<ChipData> chips = Chips.all;
  List<InputChipData> inputChips = InputChips.all;
  List<ActionChipData> actionChips = ActionChips.all;
  List<FilterChipData> filterChips = FilterChips.all;
  List<ChoiceChipData> choiceChips = ChoiceChips.all;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(child: buildPages()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Text('Chips'),
              title: Text('ActionChip'),
            ),
            BottomNavigationBarItem(
              icon: Text('Chips'),
              title: Text('InputChip'),
            ),
            BottomNavigationBarItem(
              icon: Text('Chips'),
              title: Text('FilterChip'),
            ),
            BottomNavigationBarItem(
              icon: Text('Chips'),
              title: Text('ChoiceChip'),
            ),
            BottomNavigationBarItem(
              icon: Text('Chips'),
              title: Text('Chip'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return buildActionChips();
      case 1:
        return buildInputChips();
      case 2:
        return buildFilterChips();
      case 3:
        return buildChoiceChips();
      case 4:
        return buildChips();
      default:
        return Container();
    }
  }

  Widget buildActionChips() => Wrap(
        runSpacing: spacing,
        spacing: spacing,
        children: actionChips
            .map((actionChip) => ActionChip(
                  avatar: Icon(
                    actionChip.icon,
                    color: actionChip.iconColor,
                  ),
                  backgroundColor: Colors.grey[200],
                  label: Text(actionChip.label),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  onPressed: () => Utils.showSnackBar(
                    context,
                    'Do action "${actionChip.label}"...',
                  ),
                ))
            .toList(),
      );

  Widget buildInputChips() => Wrap(
        runSpacing: spacing,
        spacing: spacing,
        children: inputChips
            .map((inputChip) => InputChip(
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(inputChip.urlAvatar),
                  ),
                  label: Text(inputChip.label),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  onPressed: () => Utils.showSnackBar(
                    context,
                    'Interacted with "${inputChip.label}"...',
                  ),
                  onDeleted: () => setState(() => inputChips.remove(inputChip)),
                ))
            .toList(),
      );

  Widget buildChoiceChips() => Wrap(
        runSpacing: spacing,
        spacing: spacing,
        children: choiceChips
            .map((choiceChip) => ChoiceChip(
                  label: Text(choiceChip.label),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  onSelected: (isSelected) => setState(() {
                    choiceChips = choiceChips.map((otherChip) {
                      final newChip = otherChip.copy(isSelected: false);

                      return choiceChip == newChip
                          ? newChip.copy(isSelected: isSelected)
                          : newChip;
                    }).toList();
                  }),
                  selected: choiceChip.isSelected,
                  selectedColor: Colors.green,
                  backgroundColor: Colors.blue,
                ))
            .toList(),
      );

  Widget buildFilterChips() => Wrap(
        runSpacing: spacing,
        spacing: spacing,
        children: filterChips
            .map((filterChip) => FilterChip(
                  label: Text(filterChip.label),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: filterChip.color,
                  ),
                  backgroundColor: filterChip.color.withOpacity(0.1),
                  onSelected: (isSelected) => setState(() {
                    filterChips = filterChips.map((otherChip) {
                      return filterChip == otherChip
                          ? otherChip.copy(isSelected: isSelected)
                          : otherChip;
                    }).toList();
                  }),
                  selected: filterChip.isSelected,
                  checkmarkColor: filterChip.color,
                  selectedColor: filterChip.color.withOpacity(0.25),
                ))
            .toList(),
      );

  Widget buildChips() => Wrap(
        runSpacing: spacing,
        spacing: spacing,
        children: chips
            .map((chip) => Chip(
                  labelPadding: EdgeInsets.all(4),
                  avatar: CircleAvatar(
                    child: Text('AZ'),
                    backgroundColor: Colors.white.withOpacity(0.8),
                  ),
                  label: Text(chip.label),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  backgroundColor: chip.backgroundColor,
                ))
            .toList(),
      );
}

import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 83, 24, 219);

const List<Color> _colorsThemes = [
  _customColor,
  Colors.blue,
  Colors.orange,
  Colors.yellow,
  Colors.red,
  Colors.green,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor < _colorsThemes.length,
            "Colors must be between 0 and ${_colorsThemes.length - 1}");

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsThemes[0],
    );
  }
}

import 'package:flutter/material.dart';

const Color _primary = Color(0xFF8529DC);
const List<Color> _colors = [
  _primary,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

/// A class that defines a custom theme based on a selected color index.
///
/// The [ThemeCustom] class requires a [selectedColor] index, which must be
/// within the valid range of available colors. The class provides a method
/// to generate a [ThemeData] object using the color corresponding to the
/// selected index.
///
/// Throws an [AssertionError] if the [selectedColor] is not within the
/// valid range of 0 to the length of the color list minus one.
class ThemeCustom {
  final int selectedColor;

  ThemeCustom({required this.selectedColor})
    : assert(
        selectedColor >= 0 && selectedColor < _colors.length,
        'Color must be between 0 and ${_colors.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colors[selectedColor]);
  }
}

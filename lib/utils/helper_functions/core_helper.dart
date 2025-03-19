import 'package:flutter/material.dart';

class CoreHelper {
  static dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

extension ContextExt on BuildContext {
  bool get isPhone => MediaQuery.of(this).size.width < 600.0;
  bool get isIpad => MediaQuery.of(this).size.width >= 600.0;
}

extension StringExtension on String {
  String capitalizeWords() {
    if (this.isEmpty) {
      return " ";
    }
    return this
        .split(' ')
        .where((word) => word.isNotEmpty) // Filter out empty words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}

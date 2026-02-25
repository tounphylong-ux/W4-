import 'package:flutter/material.dart';

class ColorService extends ChangeNotifier {
  int _redTapCount = 0;
  int _blueTapCount = 0;

  int get redTapCount => _redTapCount;
  int get blueTapCount => _blueTapCount;

  void incrementRed() {
    _redTapCount++;
    notifyListeners(); // notify all listeners
  }

  void incrementBlue() {
    _blueTapCount++;
    notifyListeners();
  }
}

final ColorService colorService = ColorService();

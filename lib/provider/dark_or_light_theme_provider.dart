import 'package:flutter/material.dart';

class BacroundThemeProvider extends ChangeNotifier {
  bool themeChange = false;
  Color white = Colors.white;

  blackAndWhite() {
    if (themeChange) {
      return white = const Color(0xFF171725);
    } else {
      return white = Colors.white;
    }
  }

  blackAndWhiteRe() {
    if (themeChange) {
      return white = Colors.white;
    } else {
      return white = const Color(0xFF171725);
    }
  }

  buttonTheme() {
    if (themeChange) {
      return white = const Color(0xFF1D2335);
    } else {
      return white = const Color(0xFFF1F1F5);
    }
  }

  themeTrueChange() {
    themeChange = !themeChange;
    notifyListeners();
  }
}

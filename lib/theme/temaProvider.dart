import 'package:flutter/material.dart';

class ThemeChangeProvider with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData? _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData? get currentTheme => this._currentTheme;

  ThemeChangeProvider(int theme) {
    switch (theme) {
      case 1:
        this._darkTheme = false;
        this._customTheme = false;
        this._currentTheme = ThemeData.light();
        break;

      case 2:
        this._darkTheme = true;
        this._customTheme = false;
        this._currentTheme = ThemeData.dark();
        break;

      case 3:
        this._darkTheme = false;
        this._customTheme = true;
        break;

      default:
        this._darkTheme = false;
        this.customTheme = false;
        this._currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    this._customTheme = false;
    this._darkTheme = value;

    if (value) {
      this._currentTheme = ThemeData.dark().copyWith(
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff162028),
      );
    } else {
      this._currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    this._darkTheme = false;
    this._customTheme = value;

    if (value) {
      this._currentTheme = ThemeData.dark();
    } else {
      this._currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}

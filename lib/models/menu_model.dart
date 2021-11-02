import 'package:flutter/material.dart';

class MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _activeColor = Colors.white;
  Color _inactiveColor = Colors.grey;
  Color _backgroundColor = Colors.black;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

  Color get getActiveColor => this._activeColor;

  set setActiveColor(Color color) {
    this._activeColor = color;
  }

  Color get getInactiveColor => this._inactiveColor;

  set setInactiveColor(Color color) {
    this._inactiveColor = color;
  }

  Color get getBackgroundColor => this._backgroundColor;

  set setBackgroundColor(Color color) {
    this._backgroundColor = color;
  }
}

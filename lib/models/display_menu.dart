import 'package:flutter/material.dart';

class DisplayMenu with ChangeNotifier {
  bool _mostrar = true;

  bool get getMostrar => this._mostrar;

  set setMostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}

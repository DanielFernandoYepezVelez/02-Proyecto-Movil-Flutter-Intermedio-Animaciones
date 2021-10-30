import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    /* print('Pagina Que Se Define Gracias Al Page Controller: ' +
        currentPage.toString()); */
    this._currentPage = currentPage;
    notifyListeners();
  }
}

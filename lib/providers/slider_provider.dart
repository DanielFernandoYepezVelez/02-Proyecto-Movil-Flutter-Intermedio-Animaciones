import 'package:flutter/material.dart';

/* ESTA CLASE ES UN MODELO POR QUE EL PROVIDER 
ME AYUDA A COMPARTIR LA INFORMACIÓN ENTRE DIFERENTES
WIDGETS, PERO EN NINGUN MOMENTO SE ESTA SOLICITANDO
INFORMACIÓN POR MEDIO DEL PROTOCOLO HTTP. */

/* ESTA CLASE TIPO MODELO TIENE PROPIEDADES CON SUS
RESPECTIVOS GETTERS Y SETTERS Y DICHAS PROPIDADES
SE COMPARTEN ENTRE LOS DIFERENTES WIDGETS DE LA APLICACIÓN,
POR ENDE, ES UN MODELO Y NO UN PROVIDER SE DEBE TENER
ESE TEMA MUY PRESENTE. */

/* AQUI VAMOS A VER, QUE MANEJAR LA PROPIEDAD
DE LOS BULLETS EN UN PROVIDER ES MAS OPTIMO QUE
SI LOS HUBIERAMOS MANEJADO COMO LOS COLORES,
QUE LOS PASAMOS POR PARAMETROS (LOS OBJETOS
EN DART SE PASAN POR REFERENCIA COMO EN JAVASCRIPT).
INCLUSO PODEMOS MANEJAR LOS COLORES EN ESTE MODELO
TAMBIÉN. PERO, POR TEMAS EDUCATIVOS LOS VOY A MANEJAR
DE LAS DOS FORMAS, ES DECIR, LOS COLORES POR PARAMETROS
Y LOS BULLET CON AYUDA DEL PROVIDER EN LA CLASE MODELO
SLIDER().  */

class SliderProvider with ChangeNotifier {
  double _currentPage = 0;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    /* print('Pagina Que Se Define Gracias Al Page Controller: ' +
        currentPage.toString()); */
    this._currentPage = currentPage;
    notifyListeners();
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double size) {
    this._bulletPrimario = size;
    // notifyListeners();
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double size) {
    this._bulletSecundario = size;
    // notifyListeners();
  }
}

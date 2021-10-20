import 'package:flutter/material.dart';

/* Screens */
import 'package:animations_app/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => AnimationsScreen(),
  'reto': (_) => CuadradoAnimadoScreen(),
  'circular': (_) => CircularProgressScreen(),
};

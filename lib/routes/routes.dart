import 'package:flutter/material.dart';

/* Screens */
import 'package:animations_app/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'circular': (_) => CircularProgressScreen(),
  'graficas': (_) => GraficasCircularesScreen(),
  'home': (_) => AnimationsScreen(),
  'reto': (_) => CuadradoAnimadoScreen(),
  'slide': (_) => SlideShowScreen(),
  'slideRefactor': (_) => SlideShowRefactorScreen(),
  'pinterest': (_) => PinterestScreen(),
  'emergency': (_) => EmergencyScreen(),
  'sliverList': (_) => SliverListScreen()
};

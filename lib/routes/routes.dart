import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* Screens */
import 'package:animations_app/screens/screens.dart';

/* Formato De Rutas Para Las Opciones Del Menú De La Pantalla Launcher Y La Misma Pantalla Launcher (Funcional) */
final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.cube, 'Animate Do Uno', AnimatedDoUnoScreen()),
  _Route(FontAwesomeIcons.cubes, 'Animate Do Dos', AnimateDoDosScreen()),
  _Route(FontAwesomeIcons.circleNotch, 'Circular Progress',
      CircularProgressScreen()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyScreen()),
  _Route(FontAwesomeIcons.circleNotch, 'Graficas Progreso',
      GraficasCircularesScreen()),
  _Route(FontAwesomeIcons.home, 'Home', AnimationsScreen()),
  _Route(FontAwesomeIcons.rocket, 'Launcher', LauncherScreen()),
  _Route(FontAwesomeIcons.ellipsisV, 'Navegación', NavegacionScreen()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestScreen()),
  _Route(
      FontAwesomeIcons.peopleCarry, 'Cuadro Animado', CuadradoAnimadoScreen()),
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideShowScreen()),
  _Route(FontAwesomeIcons.slideshare, 'SlideshowR', SlideShowRefactorScreen()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListScreen()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget screen;

  _Route(this.icon, this.titulo, this.screen);
}

/* ---------------------------------------------------------------------- */

/* Formato De Rutas Para Las Pantallas Existentes De Forma Directa En El Main (Funcional) */
final Map<String, Widget Function(BuildContext)> appRoutes = {
  'animatedDoUno': (_) => AnimatedDoUnoScreen(),
  'animateDoDos': (_) => AnimateDoDosScreen(),
  'circular': (_) => CircularProgressScreen(),
  'emergency': (_) => EmergencyScreen(),
  'graficas': (_) => GraficasCircularesScreen(),
  'home': (_) => AnimationsScreen(),
  'launcher': (_) => LauncherScreen(),
  'navegacionMenu': (_) => NavegacionScreen(),
  'pinterest': (_) => PinterestScreen(),
  'reto': (_) => CuadradoAnimadoScreen(),
  'slide': (_) => SlideShowScreen(),
  'slideRefactor': (_) => SlideShowRefactorScreen(),
  'sliverList': (_) => SliverListScreen(),
};

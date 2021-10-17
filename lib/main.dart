import 'package:flutter/material.dart';

/* Routes */
import 'package:animations_app/routes/routes.dart';

/* Tema De La App */
import 'package:animations_app/theme/tema.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animaciones App',
      initialRoute: 'home',
      routes: appRoutes,
      theme: tema,
    );
  }
}

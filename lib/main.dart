import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Routes */
import 'package:animations_app/routes/routes.dart';

/* Providers */
import 'package:animations_app/providers/providers.dart';

/* Tema De La App */
// import 'package:animations_app/theme/tema.dart';
import 'package:animations_app/theme/temaProvider.dart';

void main() => runApp(AppState());

/* Este Es El Primer Widget Que Se va A Crear, Es Decir,
Después De Este Widget En Adelante, En Todos Los Widgets 
Que Yo Quiera Tengo Acceso A Esta Misma Instancia De 
SliderProvider */
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangeProvider(2)),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChangeProvider>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animaciones App',
      initialRoute: 'launcher',
      routes: appRoutes,
      theme: currentTheme,
    );
  }
}

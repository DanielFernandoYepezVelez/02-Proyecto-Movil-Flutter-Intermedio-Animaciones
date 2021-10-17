import 'dart:math' as Math;
import 'package:flutter/material.dart';

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  /* Las Animaciones Necesitan Dos Cosas */
  Animation<double>? rotacion;
  AnimationController? animationController;

  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    /* Esta Es La Animación, Que Es Controlada Por El animationController */
    /* La Comento, Porque Aquí No Estoy Aplicando El Curve, En La Siguiente Si La Aplico */
    rotacion =
        Tween(begin: 0.0, end: Math.pi * 4.0).animate(animationController!);

    /* Aquí Estoy Aplicanco El Curve Para Mi Animación */
    rotacion = Tween(begin: 0.0, end: Math.pi * 4.0).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.bounceOut),
    );

    /* Los Listener Me Sirven Para Conocer El Estado De La Animación Si Ya Termino, Va A Iniciar, etc. */
    /* Nosotros Aquí Podemos Controlar Todas Las Etapas De La Animación */
    animationController!.addListener(() {
      print('Status De La Animación: ${animationController!.status}');

      if (animationController!.status == AnimationStatus.completed) {
        // animationController!.reverse();
        animationController!.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  /* El Método Build Se Ejecuta Cada Vez Que Yo Aplico El Hot Reload */
  @override
  Widget build(BuildContext context) {
    // Iniciar La Animación (Play)
    animationController!.forward();

    return AnimatedBuilder(
      animation: this.animationController!,
      // child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        // print('Rotación ' + this.rotacion!.value.toString());
        return Transform.rotate(
          angle: this.rotacion!.value,
          // child: child,
          child: _Rectangulo(),
        );
      },
    );
  }
}

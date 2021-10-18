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
  /* Las Animaciones Necesitan Dos Cosas Animation(Propiedad) Y El AnimationController(Conocer El Estado De La Aplicación) */
  Animation<double>? rotacion;
  Animation<double>? opacidad;
  Animation<double>? agrandar;
  Animation<double>? moverDerecha;
  AnimationController? animationController;

  @override
  void initState() {
    /* Inicialización Del animationController */
    this.animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    /* Esta Es La Animación, Que Es Controlada Por El animationController, Entonces, La Rotación,
     La Opacidad, Mover A La Derecha, Agrandar Van A Durar 4 Segundos */
    /* La Comento, Porque Aquí No Estoy Aplicando El Curve, En La Siguiente Si La Aplico */
    /* this.rotacion =
        Tween(begin: 0.0, end: Math.pi * 4.0).animate(animationController!); */

    /* Aquí Estoy Aplicanco El Curve Para Mi Animación */
    this.rotacion = Tween(begin: 0.0, end: Math.pi * 4.0).animate(
      CurvedAnimation(
        parent: this.animationController!,
        curve: Curves.bounceOut,
      ),
    );

    /* this.opacidad =
        Tween(begin: 0.1, end: 1.0).animate(this.animationController!); */

    /* 
      El Interval() Depende Del Tiempo Que Dure La Animación Por Completo 
        (0, Desde Que Inicia La Animación)
        (0.50, LLegar Hasta La Mitad De La Animación)
        (0.65, Inicia En El 65% De La Animación)
        (1, LLegar Al Final De La Animación)
      En Estas Etapas Del Tiempo De La Animación Aplicada En Porcentaje Se Ejecuta El Interval()
    */
    this.opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: this.animationController!,
        curve: Interval(0.65, 1, curve: Curves.easeOut),
      ),
    );

    this.moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: this.animationController!,
        curve: Curves.easeOut,
      ),
    );

    /* Va A Iniciar En 0 Pixeles Y Se Va A Agrandar Dos Veces Su Tamaño Original */
    this.agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: this.animationController!,
        curve: Curves.easeOut,
      ),
    );

    /* Los Listener Me Sirven Para Conocer El Estado De La Animación Si Ya Termino, Va A Iniciar, etc. */
    /* Nosotros Aquí Podemos Controlar Todas Las Etapas De La Animación */
    this.animationController!.addListener(() {
      // print('Status De La Animación: ${this.animationController!.status}');

      if (this.animationController!.status == AnimationStatus.completed) {
        this.animationController!.reverse();
        // this.animationController!.repeat();
        // this.animationController!.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    this.animationController!.dispose();
    super.dispose();
  }

  /* El Método Build Se Ejecuta Cada Vez Que Yo Aplico El Hot Reload */
  @override
  Widget build(BuildContext context) {
    /* Me Ayuda A Saber Si Ya Termino Una Animación En Especifico */
    // print('Rotación: ${this.rotacion!.value}');
    // print('Opacidad: ${this.opacidad!.value}');

    // Iniciar La Animación (Play)
    this.animationController!.forward();

    /* Si Tenemos Un Widget Muy Pesado, Lo Mejor Es Ponerlo En El Child Y Pasarlo Por Referencia, 
    Para Que El AnimatedBuilder Lo Construya Una Sola Vez, De Lo Contrario, Lo Va Construir
    Cada Vez Que Se Cree El AnimatedBuilder */
    return AnimatedBuilder(
      animation: this.animationController!,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        // print('Rotación ' + this.rotacion!.value.toString());
        return Transform.translate(
          offset: Offset(this.moverDerecha!.value, 0),
          child: Transform.rotate(
            angle: this.rotacion!.value,
            // child: childRectangulo Se Esta Pasando Por Referencia,
            child: Opacity(
              opacity: this.opacidad!.value,
              child: Transform.scale(
                scale: this.agrandar!.value,
                child: childRectangulo,
              ),
            ),
          ),
        );
      },
    );
  }
}

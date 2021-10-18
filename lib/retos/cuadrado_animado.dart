import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CuadradoAnimadoScreen extends StatelessWidget {
  const CuadradoAnimadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;
  late AnimationController animationController;

  // Iniciar La Animación Cuando Se Construya El Widget Por Primera Vez O Con El Restart
  @override
  void initState() {
    this.animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
    );

    this.moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: this.animationController,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut),
      ),
    );

    this.moverArriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: this.animationController,
        curve: Interval(0.25, 0.50, curve: Curves.bounceOut),
      ),
    );

    this.moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: this.animationController,
        curve: Interval(0.50, 0.75, curve: Curves.bounceOut),
      ),
    );

    this.moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: this.animationController,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    this.animationController.addListener(() {
      if (this.animationController.status == AnimationStatus.completed) {
        this.animationController.reset();
      }
    });

    super.initState();
  }

  // Que El Controller Deje De Escuchar
  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.animationController.forward();

    return AnimatedBuilder(
      animation: this.animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.translate(
          offset: Offset(
            this.moverDerecha.value + this.moverIzquierda.value,
            this.moverArriba.value + this.moverAbajo.value,
          ),
          child: childRectangulo,
        );
      },
    );
  }
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

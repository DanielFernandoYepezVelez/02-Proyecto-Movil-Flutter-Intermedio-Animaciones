import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  RadialProgress({
    Key? key,
    required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.orange,
    this.grosorPrimario = 10,
    this.grosorSecundario = 4,
  }) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  double? porcentajeAnterior;
  late AnimationController animationController;

  @override
  void initState() {
    this.porcentajeAnterior = widget.porcentaje;
    this.animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.animationController.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - this.porcentajeAnterior!;
    this.porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: this.animationController,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * this.animationController.value),
              widget.colorPrimario,
              widget.colorSecundario,
              widget.grosorPrimario,
              widget.grosorSecundario,
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorPrimario,
    this.grosorSecundario,
  );

  @override
  void paint(Canvas canvas, Size size) {
    /*Es El Lapiz*/
    final paint = new Paint()
      ..strokeWidth = this.grosorSecundario
      ..color = this.colorSecundario
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    /** Donde Se Va A Dibujar (Lienzo) */
    canvas.drawCircle(center, radio, paint);

    /** Arco */
    final paintArco = new Paint()
      ..strokeWidth = this.grosorPrimario
      ..color = this.colorPrimario
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    /** La Parte Que Se Va Ir LLenando */
    double arcAngle = 2 * pi * (this.porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      (-(pi) / 2),
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

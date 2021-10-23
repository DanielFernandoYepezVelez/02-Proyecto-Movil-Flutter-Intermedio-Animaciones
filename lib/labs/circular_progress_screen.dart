import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({Key? key}) : super(key: key);

  @override
  _CircularProgressScreenState createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen>
    with SingleTickerProviderStateMixin {
  double? porcentaje = 0.0;
  double? nuevoPorcentaje = 0.0;
  late AnimationController animationController;

  @override
  void initState() {
    this.animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    this.animationController.addListener(() {
      /* El Value De La Animación Se Puede Ver Como Porcentajes De La Misma
      Que Inicia Desde 0 A 1 */
      print('Valor Del animationController: ${this.animationController.value}');

      setState(() {
        this.porcentaje = lerpDouble(
          this.porcentaje,
          this.nuevoPorcentaje,
          this.animationController.value,
        );
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          this.porcentaje = this.nuevoPorcentaje;
          this.nuevoPorcentaje = this.nuevoPorcentaje! + 10;

          if (this.nuevoPorcentaje! > 100) {
            this.nuevoPorcentaje = 0;
            this.porcentaje = 0;
          }

          /* Desde Donde Quiero, Que Siempre Inicie Esta Animación,
          Recordemos Que Siempre Vamos Desde 0.0 A 1.0 */
          this.animationController.forward(from: 0.0);

          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(this.porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    /*Es El Lapiz*/
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    /** Donde Se Va A Dibujar (Lienzo) */
    canvas.drawCircle(center, radio, paint);

    /** Arco */
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
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

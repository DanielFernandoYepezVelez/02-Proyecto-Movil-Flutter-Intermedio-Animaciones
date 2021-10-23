import 'package:flutter/material.dart';

/* Widgets */
import 'package:animations_app/widgets/widgets.dart';

class GraficasCircularesScreen extends StatefulWidget {
  const GraficasCircularesScreen({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesScreen> createState() =>
      _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            this.porcentaje += 10;

            if (this.porcentaje > 100) {
              this.porcentaje = 0;
            }
          });
        },
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: RadialProgress(porcentaje: this.porcentaje),
        ),
      ),
    );
  }
}

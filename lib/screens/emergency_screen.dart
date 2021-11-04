import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* Widgets */
import 'package:animations_app/widgets/widgets.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BotonPrincipal(),
      ),
    );
  }
}

class _CompleteBackgroundHeader extends StatelessWidget {
  const _CompleteBackgroundHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Headers(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz Solicitado',
      titulo: 'Asistencia Médica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}

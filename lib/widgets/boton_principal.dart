import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonPrincipal extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function() onPress;

  const BotonPrincipal({
    Key? key,
    this.icon = FontAwesomeIcons.circle,
    required this.texto,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BackgroundBotonPrincipal(
            icon: this.icon,
            color1: this.color1,
            color2: this.color2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40),
              FaIcon(this.icon, color: Colors.white, size: 40),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  this.texto,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _BackgroundBotonPrincipal extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;

  const _BackgroundBotonPrincipal({
    Key? key,
    required this.icon,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: FaIcon(
                this.icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            this.color1,
            this.color2,
          ],
        ),
      ),
    );
  }
}

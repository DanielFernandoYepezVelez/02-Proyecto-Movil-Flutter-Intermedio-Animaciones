import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimateDoDosScreen extends StatefulWidget {
  const AnimateDoDosScreen({Key? key}) : super(key: key);

  @override
  State<AnimateDoDosScreen> createState() => _AnimateDoDosScreenState();
}

class _AnimateDoDosScreenState extends State<AnimateDoDosScreen> {
  bool activar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),
      body: ZoomOut(
        from: 30,
        animate: this.activar,
        duration: Duration(seconds: 1),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: () {
          setState(() {
            this.activar = true;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedDoUnoScreen extends StatelessWidget {
  const AnimatedDoUnoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate Do'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.new_releases, color: Colors.blue, size: 40),
            Text(
              'Titulo',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
            ),
            Text(
              'Soy Un Texto Pequeño',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Container(width: 220, height: 2, color: Colors.blue),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: () {},
      ),
    );
  }
}

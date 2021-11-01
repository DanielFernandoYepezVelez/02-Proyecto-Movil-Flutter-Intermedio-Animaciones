import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPress;
  final IconData icon;

  const PinterestButton({required this.onPress, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
      icon: Icons.pie_chart,
      onPress: () {
        print('Icon pie_chart');
      },
    ),
    PinterestButton(
      icon: Icons.search,
      onPress: () {
        print('Icon search');
      },
    ),
    PinterestButton(
      icon: Icons.notifications,
      onPress: () {
        print('Icon Notifications');
      },
    ),
    PinterestButton(
      icon: Icons.supervised_user_circle,
      onPress: () {
        print('Icon Supervised User Circle');
      },
    ),
  ];

  PinterestMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Hola Mundo Desde El Menu'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Models */
import 'package:animations_app/models/models.dart';

class PinterestButton {
  final Function() onPress;
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
    return ChangeNotifierProvider(
      create: (_) => new MenuModel(),
      child: Center(
        child: Container(
          width: 250,
          height: 60,
          decoration: menuDecorationBackground(),
          child: _MenuItems(menuItems: this.items),
        ),
      ),
    );
  }

  BoxDecoration menuDecorationBackground() {
    return BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: -5,
          color: Colors.black38,
        ),
      ],
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        this.menuItems.length,
        (i) => _PinterestMenuButton(index: i, item: this.menuItems[i]),
      ),
    );
  }
}

// ignore: must_be_immutable
class _PinterestMenuButton extends StatelessWidget {
  Color? color;
  final int index;
  late double tamano;
  final PinterestButton item;

  _PinterestMenuButton({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonSeleccionado = Provider.of<MenuModel>(context);

    if (buttonSeleccionado.itemSeleccionado == this.index) {
      this.color = Colors.white;
      this.tamano = 35;
    } else {
      this.color = Colors.grey;
      this.tamano = 25;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<MenuModel>(context, listen: false).itemSeleccionado = index;
        this.item.onPress();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          this.item.icon,
          size: this.tamano,
          color: this.color,
        ),
      ),
    );
  }
}

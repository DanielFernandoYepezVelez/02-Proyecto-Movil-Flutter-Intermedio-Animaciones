import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Models */
import 'package:animations_app/models/models.dart';

class PinterestButton {
  final Function() onPress;
  final IconData icon;

  const PinterestButton({required this.onPress, required this.icon});
}

// ignore: must_be_immutable
class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  Color activeColor = Colors.white;
  Color inactiveColor = Colors.grey;
  Color backgroundColor = Colors.black;
  final List<PinterestButton> items;

  /* Iconos De Forma Estatica, La Refactorización
  Hace Que Mi Menu Sea Dinamico Y Que Mande Los
  Items Como Argumentos. 
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
 */
  PinterestMenu({
    Key? key,
    this.mostrar = true,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
    this.backgroundColor = Colors.black,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new MenuModel(),
      child: AnimatedOpacity(
        opacity: (this.mostrar) ? 1 : 0,
        duration: Duration(milliseconds: 250),
        child: Builder(
          builder: (BuildContext context) {
            /* Primero Se Construye El Provider Y Luego El Bilder, Por Que El Builder Trabaja Bajo El Contexto,
            Es Decir, Construye Lo Que Necesita Primero, Para Poder Trabajar Sin Ningún Problema Después. */
            Provider.of<MenuModel>(context).setActiveColor = this.activeColor;
            Provider.of<MenuModel>(context).setInactiveColor =
                this.inactiveColor;
            Provider.of<MenuModel>(context).setBackgroundColor =
                this.backgroundColor;

            return Container(
              width: 250,
              height: 60,
              decoration: menuDecorationBackground(),
              child: _MenuItems(menuItems: this.items),
            );
          },
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
      this.color = buttonSeleccionado.getActiveColor;
      this.tamano = 35;
    } else {
      this.color = buttonSeleccionado.getInactiveColor;
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

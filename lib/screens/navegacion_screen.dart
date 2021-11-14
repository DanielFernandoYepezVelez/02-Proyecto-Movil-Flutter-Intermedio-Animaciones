import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionScreen extends StatelessWidget {
  const NavegacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationsModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink,
          title: Text('Notifications Screen'),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BotonNavigation(),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        final notiModel =
            Provider.of<_NotificationsModel>(context, listen: false);

        int numero = notiModel.numero;
        numero++;
        notiModel.numero = numero;

        if (numero >= 2) {
          final controller = notiModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}

class BotonNavigation extends StatelessWidget {
  const BotonNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int bottomActivate = Provider.of<_NotificationsModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                // child: Icon(Icons.brightness_1, size: 8, color: Colors.pink),
                child: BounceInDown(
                  from: 10,
                  animate: (bottomActivate > 0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) =>
                        Provider.of<_NotificationsModel>(context)
                            .bounceController = controller,
                    child: Container(
                      width: 12,
                      height: 12,
                      child: Text(
                        '$bottomActivate',
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ],
    );
  }
}

/* Provider Modelo (No Hago Peticiones HTTP) */
class _NotificationsModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => this._numero;

  set numero(int valor) {
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
    notifyListeners();
  }
}

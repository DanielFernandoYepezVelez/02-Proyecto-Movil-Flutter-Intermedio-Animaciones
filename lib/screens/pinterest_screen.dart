import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/* Theme Provider */
import 'package:animations_app/theme/temaProvider.dart';

/* Widgets */
import 'package:animations_app/widgets/widgets.dart';

/* Models (Provider) */
import 'package:animations_app/models/models.dart';

class PinterestScreen extends StatelessWidget {
  const PinterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new DisplayMenu(),
      child: Scaffold(
        // body: PinterestMenu(),
        // body: PinterestGrid(),
        body: Stack(
          children: [
            PinterestGrid(),
            _LocationMenu(),
          ],
        ),
      ),
    );
  }
}

class _LocationMenu extends StatelessWidget {
  const _LocationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final mostrarMenu = Provider.of<DisplayMenu>(context).getMostrar;
    final appTheme = Provider.of<ThemeChangeProvider>(context).currentTheme;

    return Positioned(
      bottom: 30,
      child: Container(
        width: widthScreen,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrarMenu,
            activeColor: appTheme!.colorScheme.secondary,
            backgroundColor: appTheme.scaffoldBackgroundColor,
            /* activeColor: Colors.red,
            inactiveColor: Colors.blueGrey, */
            items: [
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
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  double valorScrollAnterior = 0;
  final List<int> items = List.generate(200, (index) => index);
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    this.scrollController.addListener(() {
      // print('Scroll Listener ${this.scrollController.offset}');

      if (this.scrollController.offset > this.valorScrollAnterior) {
        Provider.of<DisplayMenu>(context, listen: false).setMostrar = false;
      } else {
        Provider.of<DisplayMenu>(context, listen: false).setMostrar = true;
      }

      this.valorScrollAnterior = this.scrollController.offset;
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: this.scrollController,
      crossAxisCount: 4,
      itemCount: this.items.length,
      itemBuilder: (BuildContext context, int i) => _PinterestItem(index: i),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

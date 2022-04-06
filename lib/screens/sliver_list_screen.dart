import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      // child: _Titulo(),
      // child: _ListaTareas(),
      child: Stack(
        children: [
          _MainScroll(),
          Positioned(bottom: -10, right: 0, child: _BotonNewList()),
        ],
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];

  _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        /* SliverAppBar(
          elevation: 0,
          floating: true,
          centerTitle: true,
          title: Text('Hola Mundo'),
          backgroundColor: Colors.red,
        ), */
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.black,
              child: _Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ...this.items,
              SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      height: 100,
      minWidth: size.width * 0.9,
      child: MaterialButton(
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
        onPressed: () {},
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;

  _SliverCustomHeaderDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: this.child);
  }

  @override
  double get maxExtent =>
      (this.minHeight > this.maxHeight) ? this.minHeight : this.maxHeight;

  @override
  double get minExtent =>
      (this.maxHeight > this.minHeight) ? this.maxHeight : this.minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return this.maxHeight != oldDelegate.maxHeight ||
        this.minHeight != oldDelegate.minHeight ||
        this.child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              child: Text(
                'List',
                style: TextStyle(
                  fontSize: 50,
                  color: Color(0xffD93A30),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/* class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];

  _ListaTareas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: this.items.length,
      itemBuilder: (BuildContext context, int index) => this.items[index],
    );
  }
} */

class _ListItem extends StatelessWidget {
  final Color color;
  final String titulo;

  const _ListItem({Key? key, required this.titulo, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      child: Text(
        this.titulo,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
      ),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}

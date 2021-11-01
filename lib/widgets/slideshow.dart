// import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Providers Personal */
import 'package:animations_app/providers/providers.dart';

class SlideShow extends StatelessWidget {
  final bool puntosArriba;
  final List<Widget> slides;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const SlideShow({
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12,
  });

  @override
  Widget build(BuildContext context) {
    final sliderModel = Provider.of<SliderProvider>(context, listen: false);

    sliderModel.bulletPrimario = this.bulletPrimario;
    sliderModel.bulletSecundario = this.bulletSecundario;

    return Container(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              /* Condicionales Dentro De Los Arreglos (IMPORTANTE) */
              if (this.puntosArriba)
                _Dots(
                  totalSlides: this.slides.length,
                  colorPrimario: this.colorPrimario,
                  colorSecundario: this.colorSecundario,
                ),
              Expanded(
                child: _Slides(this.slides),
              ),
              /* Condicionales Dentro De Los Arreglos (IMPORTANTE) */
              if (!this.puntosArriba)
                _Dots(
                  totalSlides: this.slides.length,
                  colorPrimario: this.colorPrimario,
                  colorSecundario: this.colorSecundario,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    this.pageViewController.addListener(() {
      // print('Página Actual: ${this.pageViewController.page}');

      final sliderModel = Provider.of<SliderProvider>(context, listen: false);
      sliderModel.currentPage = this.pageViewController.page!;
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: this.pageViewController,
        /* children: [
          _Slide(svg: 'assets/svgs/slide-1.svg'),
          _Slide(svg: 'assets/svgs/slide-2.svg'),
          _Slide(svg: 'assets/svgs/slide-3.svg'),
        ], */
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({Key? key, required this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: this.slide,
      // child: SvgPicture.asset(this.svg),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color colorPrimario;
  final Color colorSecundario;

  const _Dots({
    Key? key,
    required this.totalSlides,
    required this.colorPrimario,
    required this.colorSecundario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          this.totalSlides,
          (i) => _Dot(
            index: i,
            colorPrimario: this.colorPrimario,
            colorSecundario: this.colorSecundario,
          ),
        ),
        /* children: [
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
        ], */
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;

  const _Dot({
    Key? key,
    required this.index,
    required this.colorPrimario,
    required this.colorSecundario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderModel = Provider.of<SliderProvider>(context);
    Color color;
    double tamano;

    if (sliderModel.currentPage >= (this.index - 0.5) &&
        sliderModel.currentPage < (this.index + 0.5)) {
      tamano = sliderModel.bulletPrimario;
      color = this.colorPrimario;
    } else {
      tamano = sliderModel.bulletSecundario;
      color = this.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

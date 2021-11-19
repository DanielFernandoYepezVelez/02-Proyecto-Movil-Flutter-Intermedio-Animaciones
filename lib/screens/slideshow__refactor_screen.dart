import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

/* Provider Personal */
import 'package:animations_app/theme/temaProvider.dart';

/* Widgets Personal */
import 'package:animations_app/widgets/widgets.dart';

class SlideShowRefactorScreen extends StatelessWidget {
  const SlideShowRefactorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _SlideShowUltimo()),
          Expanded(child: _SlideShowUltimo()),
        ],
      ),
    );
  }
}

class _SlideShowUltimo extends StatelessWidget {
  const _SlideShowUltimo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChangeProvider>(context);
    final accentColor = appTheme.currentTheme!.colorScheme.secondary;

    return SlideShow(
      // puntosArriba: true,
      colorPrimario: Colors.white,
      colorSecundario: (appTheme.darkTheme) ? accentColor : Color(0xffFF5A7E),
      bulletPrimario: 20,
      bulletSecundario: 12,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}

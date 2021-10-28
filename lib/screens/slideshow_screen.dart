import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/svgs/slide-1.svg'),
      ),
    );
  }
}

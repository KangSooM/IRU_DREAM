import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPage extends StatelessWidget {
  const SvgPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SvgPicture.asset(
        'assets/icons/Polygon2.svg',
        color: Colors.black,
      ),
    );
  }
}

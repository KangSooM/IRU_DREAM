import 'package:drawing3/screens/drawing_page/local_utils/DrawingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DrawingProvider>(context);
    return Container(
      width: 74,
      height: 351,
      margin: const EdgeInsets.only(
        left: 39,
        right: 34,
        bottom: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(37)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            // spreadRadius: 3,
            blurRadius: 15,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: const Icon(Icons.home_outlined,
                  color: Color(0xFF000743), size: 40),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: const Icon(Icons.navigation_outlined,
                  color: Color(0xFF000743), size: 40),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                width: 41.18,
                height: 41.18,
                decoration: BoxDecoration(
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFF000D81),
                      Color(0xFF01062F),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.59),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: const Icon(Icons.shopping_bag_outlined,
                  color: Color(0xFF000743), size: 40),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: const Icon(Icons.circle_outlined,
                  color: Color(0xFF000743), size: 40),
            ),
          ]),
    );
  }
}

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 33,
          width: 150,
        ),
        Container(
          width: 65,
          height: 65,
          margin: const EdgeInsets.only(right: 48, left: 37, top: 0),
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(37)),
            gradient: RadialGradient(
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Color(0xFFf7f7fa),
                Color(0xFFf7f7fa),
                Color(0xFFf7f7fa),
                Color(0xFFd1d3e1),
                Color.fromARGB(255, 173, 176, 201),
                Color.fromARGB(255, 131, 133, 154),
              ],
            ),
          ),
          child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: const Center(
                child: Image(
                  image: AssetImage('assets/icons/user.png'),
                  height: 40,
                  width: 40,
                ),
              )),
        ),
      ],
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DotInfo {
  DotInfo(this.offset, this.size, this.color, this.type);
  final Offset offset;
  final double size;
  final Color color;
  final type;
}

// class DotInfo2 {
//   DotInfo2(this.offset, this.size, this.color);
//   final Offset offset;
//   final double size;
//   final Color color;
//   //final String image;
// }

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   // 중심점 좌표
//   final Offset rootOffset = const Offset(0, 0);
//   // 루트로부터의 거리(alignment로 적용할 경우 0 ~ 1.0 사이로 정의한다.)
//   //화면에 그릴 위젯 List<Widget> elements = [];
//   @override
//   void initState() {
//     var l = [];
//   }
// }

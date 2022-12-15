// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:drawing3/models/DotInfo.dart';
import 'package:drawing3/screens/drawing_page/local_utils/DrawingProvider.dart';
import 'package:drawing3/screens/drawing_page/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drawing3/screens/drawing_page/toolkit.dart';
import 'package:drawing3/screens/drawing_page/profile.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<List<DrawingProvider>>(context);
    var c = Provider.of<ChangePages>(context);

    return Scaffold(
      body: Container(
        color: const Color(0xFF0C092C), //#F4F8FE
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [ToolKit(), Profile()],
            ), //toolkit and user_profile
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: 1047,
                    height: 736,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/pages/iru${c.pages}.png',
                            ),
                            fit: BoxFit.cover)),
                    margin: const EdgeInsets.only(
                      top: 53,
                    ),
                    child: Stack(children: [
                      Positioned.fill(
                        child: CustomPaint(
                            painter: DrawingPainter(p[c.pages].lines)
                            // p.brushMode
                            //     ? DrawingPainter(p.lines)
                            //     : cDrawingPainter(p.dots),
                            ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onPanStart: (s) {
                          if (p[c.pages].eraseMode) {
                            p[c.pages].erase(s.localPosition);
                          } else {
                            p[c.pages].drawStart(s.localPosition);
                          }
                        },
                        onPanUpdate: (s) {
                          if (p[c.pages].eraseMode) {
                            p[c.pages].erase(s.localPosition);
                          } else {
                            p[c.pages].brushDrawing(s.localPosition);
                          }
                        },
                        child: Container(),
                      ),
                    ])),
                const SideBar(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 31, right: 141),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // GestureDetector(
                  //     behavior: HitTestBehavior.translucent,
                  //     onTap: () {
                  //       p.changeBrushMode();
                  //     },
                  //     child: IconButton(
                  //       icon: SvgPage(),
                  //       onPressed: () {},
                  //     )),
                  // GestureDetector(
                  //     behavior: HitTestBehavior.translucent,
                  //     onTap: () {
                  //       p.changeBrushMode();
                  //     },
                  //     child: IconButton(
                  //       icon: Image.asset(
                  //         'assets/icons/Polygon 2.png',
                  //         color: Colors.white,
                  //         width: 35,
                  //         height: 30,
                  //       ),
                  //       onPressed: () {},
                  //     )),
                  _previousPage(c.pages, context),
                  const SizedBox(
                    height: 30,
                    width: 17,
                  ),
                  Text(
                    '${c.pages}/5',
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                    width: 17,
                  ),
                  _followingPage(c.pages, context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _previousPage(int page, BuildContext context) {
    var c = Provider.of<ChangePages>(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          c.changePages = page - 1;
          c.pages > 0 ? null : c.changePages = 1;
        });
      },
      child: const Icon(Icons.arrow_back_ios_new_rounded,
          color: Colors.white, size: 30),
    );
  }

  Widget _followingPage(int page, BuildContext context) {
    var c = Provider.of<ChangePages>(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          c.changePages = page + 1;
          c.pages < 6 ? null : c.changePages = 5;
        });
      },
      child: const Icon(Icons.arrow_forward_ios_rounded,
          color: Colors.white, size: 30),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter(this.lines);
  final List<List<DotInfo>> lines;
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(
        rect,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = const Color(0xFF0C092C));
    canvas.clipRect(rect);
    canvas.save();
    canvas.translate(0.0, 100.0);
    canvas.restore();

    for (var oneLine in lines) {
      var color;
      var size;
      var l = <Offset>[];
      var p = Path();
      for (var oneDot in oneLine) {
        color ??= oneDot.color;
        size ??= oneDot.size;
        l.add(oneDot.offset);
      }
      p.addPolygon(l, false);
      canvas.drawPath(
          p,
          Paint()
            ..color = color
            ..strokeWidth = size
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // ignore: todo
    // TODO: implement shouldRepaint
    return true;
  }
}

// class cDrawingPainter extends CustomPainter {
//   cDrawingPainter(this.dots);
//   final List<List<DotInfo>> dots;
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     canvas.drawRect(
//         rect,
//         Paint()
//           ..style = PaintingStyle.stroke
//           ..color = const Color(0xFF0C092C));
//     canvas.clipRect(rect);
//     canvas.save();
//     canvas.translate(0.0, 100.0);
//     canvas.restore();

//     for (var oneLine in dots) {
//       var color;
//       var size;
//       var l = <Offset>[];
//       var p = Path();
//       for (var oneDot in oneLine) {
//         color ??= oneDot.color;
//         size ??= oneDot.size;
//         l.add(oneDot.offset);
//       }
//       p.addPolygon(l, false);
//       canvas.drawPath(
//           p,
//           Paint()
//             ..color = color
//             ..strokeWidth = size
//             ..strokeCap = StrokeCap.round
//             ..style = PaintingStyle.stroke);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // ignore: todo
//     // TODO: implement shouldRepaint
//     return true;
//   }
// }

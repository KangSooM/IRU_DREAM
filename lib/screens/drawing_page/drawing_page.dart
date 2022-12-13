import 'package:drawing3/models/DotInfo.dart';
import 'package:drawing3/screens/drawing_page/local_utils/DrawingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drawing3/svg/svg_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawingPage extends StatefulWidget {
  @override
  _DrawingPageState createState() => _DrawingPageState();
}

int _pages = 1;

class _DrawingPageState extends State<DrawingPage> {
  bool selected = false;
  var _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DrawingProvider>(context);
    return Scaffold(
      body: Container(
        width: 1366,
        height: 1024,
        color: Color(0xFF0C092C),
        child: Column(
          children: [
            Container(
              width: 647,
              height: 83,
              //color: Color(0xFF15264a),
              decoration: const BoxDecoration(
                color: Color(0xFF15264a),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
              ),
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _brush(p),
                        _crayon(p),
                        _eraser(p),
                        IconButton(
                          icon: Icon(Icons.format_shapes, size: 34),
                          color: _color,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.image_outlined, size: 34),
                          color: _color,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.circle_outlined, size: 34),
                          color: _color,
                          onPressed: () {},
                        ),
                        Container(
                          width: 116,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Slider(
                                activeColor: Colors.white,
                                inactiveColor: Colors.white,
                                value: p.size,
                                onChanged: (size) {
                                  p.changeSize = size;
                                },
                                min: 3,
                                max: 15),
                          ),
                        ),
                        _colorWidget(Color(0xFF004eff)),
                        _colorWidget(Color(0xFFa7beff)),
                        _colorWidget(Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                              'assets/pages/2.png',
                            ),
                            fit: BoxFit.cover)),
                    margin: EdgeInsets.fromLTRB(0, 68, 0, 0),
                    child: Stack(children: [
                      Positioned.fill(
                        child: CustomPaint(
                          painter: DrawingPainter(p.lines),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onPanStart: (s) {
                          if (p.eraseMode) {
                            p.erase(s.localPosition);
                          } else {
                            p.drawStart(s.localPosition);
                          }
                        },
                        onPanUpdate: (s) {
                          if (p.eraseMode) {
                            p.erase(s.localPosition);
                          } else {
                            p.drawing(s.localPosition);
                          }
                        },
                        child: Container(),
                      ),
                    ])),
                Container(
                  width: 74,
                  height: 351,
                  margin: EdgeInsets.only(
                    left: 39,
                    right: 34,
                    bottom: 13,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(53)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            p.changeBrushMode();
                          },
                          child: Icon(Icons.home_outlined,
                              color: Color(0xFF000743), size: 40),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            p.changeBrushMode();
                          },
                          child: Icon(Icons.navigation_outlined,
                              color: Color(0xFF000743), size: 40),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            p.changeBrushMode();
                          },
                          child: Container(
                            width: 41.18,
                            height: 41.18,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Color(0xFF000D81),
                                  Color(0xFF01062F),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20.59),
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            p.changeBrushMode();
                          },
                          child: Icon(Icons.shopping_bag_outlined,
                              color: Color(0xFF000743), size: 40),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            p.changeBrushMode();
                          },
                          child: Icon(Icons.circle_outlined,
                              color: Color(0xFF000743), size: 40),
                        ),
                      ]),
                )
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
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        _pages -= 1;
                        _pages > 0 ? null : _pages = 1;
                      });
                    },
                    child: Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white, size: 30),
                  ),
                  SizedBox(
                    height: 30,
                    width: 17,
                  ),
                  Text(
                    '$_pages/32',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 17,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        _pages += 1;
                      });
                    },
                    child: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white, size: 30),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _eraser(DrawingProvider p) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        p.changeEraseMode();
      },
      child: Icon(Icons.rectangle_outlined,
          color: p.eraseMode ? p.color : Colors.white),
    );
  }

  GestureDetector _crayon(DrawingProvider p) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        p.changeCrayonMode();
      },
      child: Icon(
        Icons.edit,
        color: p.crayonMode ? p.color : Colors.white,
        size: 34,
      ),
    );
  }

  GestureDetector _brush(DrawingProvider p) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        p.changeBrushMode();
      },
      child: Icon(
        Icons.brush_rounded,
        color: p.brushMode ? p.color : Colors.white,
        size: 34,
      ),
    );
  }

  Widget _colorWidget(Color color) {
    var p = Provider.of<DrawingProvider>(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        p.changeColor = color;
      },
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: p.color == color
                ? Border.all(color: Colors.white, width: 2)
                : null,
            color: color),
      ),
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
          ..color = Color(0xFF0C092C));
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
    // TODO: implement shouldRepaint
    return true;
  }
}

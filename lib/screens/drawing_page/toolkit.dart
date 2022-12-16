import 'package:drawing3/screens/drawing_page/local_utils/DrawingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

final List<Color> colorl = [
  Color.fromARGB(255, 175, 197, 249),
  Color(0xFF004eff),
  Color(0xFF000000)
];

class ToolKit extends StatelessWidget {
  ToolKit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Provider.of<ChangePages>(context);
    return Container(
      width: 500,
      //color: Color(0xFF15264a),
      decoration: BoxDecoration(
        color: const Color(0xFF15264a),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            //spreadRadius: 3,
            blurRadius: 6,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(35)),
      ),
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.bottom),
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _brush(c),
            _crayon(c),
            _eraser(c),
            // IconButton(
            //   icon: const Icon(Icons.format_shapes, size: 34),
            //   color: Colors.white,
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: const Icon(Icons.image_outlined, size: 34),
            //   color: Colors.white,
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: const Icon(Icons.circle_outlined, size: 34),
            //   color: Colors.white,
            //   onPressed: () {},
            // ),
            SizedBox(
              width: 116,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white,
                    value: c.size,
                    onChanged: (size) {
                      c.changeSize = size;
                    },
                    min: 3,
                    max: 15),
              ),
            ),
            // _colorWidget(Color(0xFF004eff), context),
            // _colorWidget(Color(0xFFa7beff), context),
            // _colorWidget(Color(0xFF000000), context),
            _colorWidget(colorl[0], context, 0),
            _colorWidget(colorl[1], context, 1),
            _colorWidget(colorl[2], context, 2),
          ],
        ),
      ),
    );
  }

  GestureDetector _eraser(ChangePages c) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        c.changeEraseMode();
      },
      child: Image.asset('assets/icons/eraser.png',
          color: c.eraseMode ? c.color : Colors.white),
    );
  }

  GestureDetector _crayon(ChangePages c) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        c.changeCrayonMode();
      },
      child: Icon(
        Icons.edit,
        color: c.crayonMode ? c.color : Colors.white,
        size: 34,
      ),
    );
  }

  GestureDetector _brush(ChangePages c) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        c.changeBrushMode();
      },
      child: Icon(
        Icons.brush_rounded,
        color: c.brushMode ? c.color : Colors.white,
        size: 34,
      ),
    );
  }

  Widget _colorWidget(Color color, BuildContext context, int num) {
    var c = Provider.of<ChangePages>(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        c.changeColor = color;
        c.changeBrushMode();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: color, //default color
                    onColorChanged: (Color color1) {
                      c.changeColor = color1;
                      colorl[num] = color1;
                      color = color1;
                    },
                  ),
                ),
              );
            });
      },
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: c.color == colorl[num]
                ? Border.all(color: Colors.white, width: 2)
                : null,
            color: colorl[num]),
      ),
    );
  }
}

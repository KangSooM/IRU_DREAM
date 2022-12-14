import 'package:drawing3/screens/drawing_page/local_utils/DrawingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToolKit extends StatelessWidget {
  const ToolKit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DrawingProvider>(context);
    return Container(
      width: 647,
      height: 83,
      //color: Color(0xFF15264a),
      decoration: BoxDecoration(
        color: Color(0xFF15264a),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            //spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
      ),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.bottom),
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
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.image_outlined, size: 34),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.circle_outlined, size: 34),
                  color: Colors.white,
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
                _colorWidget(Color(0xFF004eff), context),
                _colorWidget(Color(0xFFa7beff), context),
                _colorWidget(Colors.black, context),
              ],
            ),
          ),
        ],
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

  Widget _colorWidget(Color color, BuildContext context) {
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

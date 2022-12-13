import 'dart:math';

import 'package:drawing3/models/DotInfo.dart';
import 'package:flutter/material.dart';

//drawing lines, color, size, mode
class DrawingProvider extends ChangeNotifier {
  final lines = <List<DotInfo>>[];

  double _size = 3;
  double get size => _size;
  set changeSize(double size) {
    _size = size;
    notifyListeners();
  }

  Color _color = Colors.black;
  Color get color => _color;
  set changeColor(Color color) {
    _color = color;
    notifyListeners();
  }

  bool _eraseMode = false;
  bool get eraseMode => _eraseMode;

  void changeEraseMode() {
    _eraseMode = true;
    _brushMode = false;
    _crayonMode = false;
    notifyListeners();
  }

  bool _brushMode = true;
  bool get brushMode => _brushMode;

  void changeBrushMode() {
    _brushMode = true;
    _eraseMode = false;
    _crayonMode = false;
    notifyListeners();
  }

  void drawStart(Offset offset) {
    var oneLine = <DotInfo>[];
    oneLine.add(DotInfo(offset, size, color));
    lines.add(oneLine);
    notifyListeners();
  }

  bool _crayonMode = false;
  bool get crayonMode => _crayonMode;

  void changeCrayonMode() {
    _crayonMode = true;
    _eraseMode = false;
    _brushMode = false;
    notifyListeners();
  }

  void drawing(Offset offset) {
    lines.last.add(DotInfo(offset, size, color));
    notifyListeners();
  }

  void erase(Offset offset) {
    final eraseGap = size;
    for (var oneLine in List<List<DotInfo>>.from(lines)) {
      for (var oneDot in oneLine) {
        if (sqrt(pow((offset.dx - oneDot.offset.dx), 2) +
                pow((offset.dy - oneDot.offset.dy), 2)) <
            eraseGap) {
          lines.remove(oneLine);
          break;
        }
      }
    }
    notifyListeners();
  }
}

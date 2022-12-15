// ignore_for_file: file_names

import 'dart:math';

import 'package:drawing3/models/DotInfo.dart';
import 'package:flutter/material.dart';

double _size = 3;

Color _color = Colors.black;

bool _eraseMode = false;

bool _brushMode = true;

bool _crayonMode = false;

class ChangePages extends ChangeNotifier {
  int _pages = 0;
  int get pages => _pages;

  double get size => _size;
  bool get eraseMode => _eraseMode;
  Color get color => _color;
  bool get brushMode => _brushMode;
  bool get crayonMode => _crayonMode;

  List<DrawingProvider> array = [];

  ChangePages() {
    array.add(DrawingProvider());
    array.add(DrawingProvider());
    array.add(DrawingProvider());
    array.add(DrawingProvider());
    array.add(DrawingProvider());
  }

  set changePages(int page) {
    _pages = page;
    notifyListeners();
  }

  set changeSize(double size) {
    _size = size;
    notifyListeners();
  }

  set changeColor(Color color) {
    _color = color;
    notifyListeners();
  }

  void changeEraseMode() {
    _eraseMode = true;
    _brushMode = false;
    _crayonMode = false;
    notifyListeners();
  }

  void changeBrushMode() {
    _brushMode = true;
    _eraseMode = false;
    _crayonMode = false;
    notifyListeners();
  }

  void changeCrayonMode() {
    _crayonMode = true;
    _eraseMode = false;
    _brushMode = false;
    notifyListeners();
  }
}

//drawing lines, color, size, mode
class DrawingProvider extends ChangeNotifier {
  final lines = <List<DotInfo>>[];

  double get size => _size;
  bool get eraseMode => _eraseMode;
  Color get color => _color;
  bool get brushMode => _brushMode;
  bool get crayonMode => _crayonMode;

  void drawStart(Offset offset) {
    var oneLine = <DotInfo>[];
    _brushMode
        ? oneLine.add(DotInfo(offset, size, color))
        : oneLine.add(DotInfo(offset, size, color.withOpacity(0.6)));
    lines.add(oneLine);
    notifyListeners();
  }

  void brushDrawing(Offset offset) {
    _brushMode
        ? lines.last.add(DotInfo(offset, size, color))
        : lines.last.add(DotInfo(offset, size, color));
    //dots.last.add(DotInfo2(offset, size, color));
    notifyListeners();
  }

  // String _image = 'assets/icons/user/png';
  // String get image => _image;

  // void crayonDrawing(Offset offset) {
  //   lines.last.add(DotInfo(offset, size, Colors.black.withOpacity(0.3)));
  //   dots.last.add(DotInfo2(offset, size, color));
  //   notifyListeners();
  // }

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

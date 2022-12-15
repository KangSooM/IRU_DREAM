// ignore_for_file: file_names

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

  int _pages = 1;
  int get pages => _pages;
  set changePages(int page) {
    _pages = page;
    notifyListeners();
  }

  void drawStart(Offset offset) {
    var oneLine = <DotInfo>[];
    _brushMode
        ? oneLine.add(DotInfo(offset, size, color, 'b'))
        : oneLine.add(DotInfo(offset, size, color.withOpacity(0.6), 'c'));
    lines.add(oneLine);
    notifyListeners();
  }

  // void cDrawStart(Offset offset) {
  //   var oneLine = <DotInfo2>[];
  //   oneLine.add(DotInfo2(offset, size, color));
  //   dots.add(oneLine);
  //   notifyListeners();
  // }

  bool _crayonMode = false;
  bool get crayonMode => _crayonMode;

  void changeCrayonMode() {
    _crayonMode = true;
    _eraseMode = false;
    _brushMode = false;
    notifyListeners();
  }

  void brushDrawing(Offset offset) {
    _brushMode
        ? lines.last.add(DotInfo(offset, size, color, 'b'))
        : lines.last.add(DotInfo(offset, size, color, 'c'));
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

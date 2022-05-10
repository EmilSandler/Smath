import 'dart:ui';

import 'package:flame/palette.dart';

class Styles {
  static Paint white = BasicPalette.white.paint();
  static Paint blue = BasicPalette.blue.paint();
  static Paint red = BasicPalette.red.paint();
  static Paint magenta = BasicPalette.magenta.paint();

  static Paint snakeBody = BasicPalette.black.paint()
    ..style = PaintingStyle.fill
    ..strokeWidth = 4;

  static Paint gameOver = BasicPalette.red.paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10;

  static Paint boardBackground = Paint()..color = const Color.fromARGB(255, 49, 209, 21);
  static Paint boardBackgroundDark = Paint()..color = const Color.fromARGB(255, 34, 145, 15)..style = PaintingStyle.fill;

}

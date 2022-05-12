import 'dart:ui';

import 'package:flame/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flame_snake/game/config/game_config.dart';

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

  static Paint boardBackground = Paint()
    ..color = const Color.fromARGB(255, 49, 209, 21);
  static Paint boardBackgroundDark = Paint()
    ..color = const Color.fromARGB(255, 34, 145, 15)
    ..style = PaintingStyle.fill
    ..filterQuality = FilterQuality.medium;
  static Paint boardBackgroundBorder = Paint()
    ..style = PaintingStyle.fill
    ..strokeWidth = 5.0
    ..shader = const LinearGradient(
        colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(120, 255, 255, 255)])
        .createShader(Rect.fromCenter(center: const Offset(GameConfig.cellSize / 2.0, GameConfig.cellSize / 2.0), width: GameConfig.cellSize / 1.0, height: GameConfig.cellSize / 1.0));
}
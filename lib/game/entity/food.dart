

import 'dart:ui';
import 'dart:ui' hide TextStyle, TextDirection;
import 'package:flame/components.dart';
import 'package:flutter_flame_snake/game/config/game_config.dart';
import 'package:flutter_flame_snake/game/config/styles.dart';

class Food {
  static TextPaint paint = TextPaint();



  static void render(Canvas canvas, Vector2 location, int cellSize, int sum) {
    canvas.drawCircle(
        findMiddle(location, cellSize), findRadius(cellSize), Styles.red);
    Vector2 textLocation = Vector2(location.x + 8, location.y + 3.8);

    paint.render(canvas, sum.toString(), textLocation);
  }

  static Offset findMiddle(Vector2 location, int cellSize) {
    return Offset(location.x + cellSize / 2, location.y + cellSize / 2);
  }

  static double findRadius(int cellSize) {
    return cellSize / 2 - GameConfig.foodRadius;
  }
}


import 'dart:ui';
import 'dart:ui' hide TextStyle, TextDirection;
import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flutter_flame_snake/game/config/game_config.dart';
import 'package:flutter_flame_snake/game/config/styles.dart';

class Food {
  static TextPaint paint = TextPaint();
  static late Sprite appleSprite;
  static Images images = Flame.images;
  static bool isImageLoaded = false;

  // Future<void> onload() async {
  //   images.load('apple.png');
  //   appleSprite = Sprite(images.fromCache('apple.png'));
  //
  // }

  static Future<void> render(Canvas canvas, Vector2 location, int cellSize, int sum)  async {
    // canvas.drawCircle(
    //     findMiddle(location, cellSize), findRadius(cellSize), Styles.red);
    if (!isImageLoaded) {
      await images.load('apple.png');
      // paint = TextPaint(style: TextStyle(fontSize: 20));
      isImageLoaded = true;
    }
    appleSprite = Sprite(images.fromCache('apple.png'));
    appleSprite.render(canvas, position: location, size: Vector2.all(cellSize as double));
    Vector2 textLocation = Vector2(location.x + (sum.toString().length == 1 ? 8 : 3), location.y + 4.5);

    paint.render(canvas, sum.toString(), textLocation);
  }

  static Offset findMiddle(Vector2 location, int cellSize) {
    return Offset(location.x + cellSize / 2, location.y + cellSize / 2);
  }

  static double findRadius(int cellSize) {
    return cellSize / 2 - GameConfig.foodRadius;
  }
}
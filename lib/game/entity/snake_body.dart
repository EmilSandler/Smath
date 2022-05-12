import 'dart:html';
import 'dart:ui';

import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_flame_snake/game/config/game_config.dart';
import 'package:flutter_flame_snake/game/config/styles.dart';
import '../config/snake_config.dart';

class SnakeBody {

  static Images images = Flame.images;

  static SpriteSheet snakeSpriteSheet = SpriteSheet(image: images.fromCache('snake-graphics.png'), srcSize: Vector2.all(64.0));
  static bool isSpriteSheetLoaded = false;

  static Future<void> render(Canvas canvas, Vector2 location, int cellSize, BodyType bodyType) async {
    if (!isSpriteSheetLoaded) {
      snakeSpriteSheet = SpriteSheet(image: await images.load('snake-graphics.png'), srcSize: Vector2.all(64.0));
      isSpriteSheetLoaded = true;
    }
    snakeSpriteSheet.getSprite(SnakeConfig.snakeConfig[bodyType.index].x as int, SnakeConfig.snakeConfig[bodyType.index].y as int).render(canvas, position: location, size: Vector2.all(cellSize as double));
    // canvas.drawImage(snakeSpriteSheet.getSprite(0, 2).image, Offset(location.x, location.y),/* findEnd(location, cellSize),*/ BasicPalette.white.paint());
    // canvas.drawRect(
    //     Rect.fromPoints(
    //         findStart(location, cellSize), findEnd(location, cellSize)),
    //     Styles.snakeBody);
  }

  static Offset findStart(Vector2 location, int cellSize) {
    return Offset(location.x + GameConfig.snakeLineThickness / 2,
        location.y + GameConfig.snakeLineThickness / 2);
  }

  static Offset findEnd(Vector2 location, int cellSize) {
    return Offset(location.x + cellSize - GameConfig.snakeLineThickness / 2,
        location.y + cellSize - GameConfig.snakeLineThickness / 2);
  }
}

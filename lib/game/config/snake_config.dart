import 'package:flame/components.dart';

enum BodyType {
  head_top,
  head_right,
  head_left,
  head_bottom,
  left_right,
  top_bottom,
  top_left,
  top_right,
  bottom_left,
  bottom_right,
  tail_top,
  tail_bottom,
  tail_left,
  tail_right,
  empty
}

class SnakeConfig {

  static final snakeConfig = [
    Vector2(0, 3),
    Vector2(0, 4),
    Vector2(1, 3),
    Vector2(1, 4),
    Vector2(0, 1),
    Vector2(1, 2),
    Vector2(2, 2),
    Vector2(1, 0),
    Vector2(0, 2),
    Vector2(0, 0),
    Vector2(3, 4),
    Vector2(2, 3),
    Vector2(2, 4),
    Vector2(3, 3),
    Vector2(1, 1)
  ];
}
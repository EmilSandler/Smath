import 'dart:collection';

import '../component/cell.dart';
import '../config/snake_config.dart';

class SnakeBodyPart extends LinkedListEntry<SnakeBodyPart> {

  Cell cell;
  BodyType? type;

  SnakeBodyPart(this.cell, this.type);

  factory SnakeBodyPart.fromCell(Cell cell) {
    cell.cellType = CellType.snakeBody;
    return SnakeBodyPart(cell, BodyType.empty);
  }
}
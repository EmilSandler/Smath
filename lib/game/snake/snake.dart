
import 'dart:collection';

import 'package:flame/components.dart';
import 'package:flutter_flame_snake/game/component/cell.dart';
import 'package:flutter_flame_snake/game/snake/snake_body_part.dart';
import '../config/snake_config.dart';

import 'grid.dart';

enum Direction { up, right, down, left }

class Snake {

  final LinkedList<SnakeBodyPart> snakeBody = LinkedList();

  Direction direction = Direction.right;
  Cell head = Cell.zero;

  void move(Cell nextCell) {
    _removeLast();
    head = nextCell;
    _addFirst(head);
    setBodyType();
  }

  void grow(Cell nextCell) {
    head = nextCell;
    _addFirst(head);
    setBodyType();
  }

  bool checkCrash(Cell nextCell) {
    for (var part in snakeBody) {
      if (part.cell == nextCell) {
        return true;
      }
    }

    return false;
  }

  void setHead(Cell cell) {
    head = cell;
  }

  bool isHorizontal() {
    return direction == Direction.left || direction == Direction.right;
  }

  Vector2 displacementToHead(Vector2 reference) {
    return reference - head.location;
  }

  void addCell(Cell cell) {
    _add(SnakeBodyPart.fromCell(cell));
  }

  void _add(SnakeBodyPart part) {
    snakeBody.add(part);
  }

  void _addFirst(Cell cell) {
    snakeBody.addFirst(SnakeBodyPart.fromCell(cell));
  }

  void _removeLast() {
    snakeBody.last.cell.cellType = CellType.empty;
    snakeBody.remove(snakeBody.last);
  }

  bool removeOne(Grid grid) {
    if(snakeBody.length == 1){
      return false;
    }
    grid.cells[snakeBody.last.cell.row][snakeBody.last.cell.column].cellType = CellType.empty;
    return snakeBody.remove(snakeBody.last);
  }

  void setBodyType() {
    Cell? prevCell;
    for (SnakeBodyPart part in snakeBody) {
      if (part == snakeBody.first) {
        part.type = BodyType.head_top;
      }
      else {
        if (part == snakeBody.last) {
          if (part.previous != null) {
            prevCell = part.previous?.cell;
          }
          if (prevCell != null &&
              part.cell.location.x == prevCell.location.x) {
            if (part.cell.location.y > prevCell.location.y) {
              part.type = BodyType.tail_bottom;
            }
            else {
              part.type = BodyType.tail_top;
            }
          }
          else {
            if (prevCell != null &&
                part.cell.location.x > prevCell.location.x) {
              part.type = BodyType.tail_left;
            }
            else {
              part.type = BodyType.tail_right;
            }
          }
        }
        else {
          part.type = BodyType.left_right;
        }
      }
  }
  }
}
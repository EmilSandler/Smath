import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutter_flame_snake/game/component/world.dart';

import 'component/background.dart';
import 'component/problems.dart';
import 'config/game_config.dart';
import 'snake/grid.dart';
import 'snake/offsets.dart';

class SnakeGame extends FlameGame with TapDetector, KeyboardEvents{
  Grid grid = Grid(GameConfig.rows, GameConfig.columns, GameConfig.cellSize);
  World? world;
  OffSets offSets = OffSets(Vector2.zero());
  Problems problem = Problems().initProblems();
  TextComponent scoreTextComponent = TextComponent();
  TextComponent problemTextComponent = TextComponent();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    //double maxSide = min(size.x, size.y);
    //camera.viewport = FixedResolutionViewport(Vector2.all(maxSide));
    offSets = OffSets(canvasSize);

    add(BackGround(GameConfig.cellSize));
    // ignore: avoid_function_literals_in_foreach_calls
    grid.cells.forEach((rows) => rows.forEach((cell) => add(cell)));

    grid.generateFood(problem);

    scoreTextComponent = TextComponent(text:'Score: 0', position: Vector2(10,10), anchor: Anchor.topLeft);
    problemTextComponent = TextComponent(text:"Problem: ${problem.x} + ${problem.y}", position: Vector2(500,10), anchor: Anchor.topRight);

    add(scoreTextComponent);
    add(problemTextComponent);
    world = World(grid);
    world?.prob = problem;
    add(world!);

  }

  @override
  void onTapUp(TapUpInfo info) {
    world!.onTapUp(info);
  }

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed,) {
    final isKeyDown = event is RawKeyDownEvent;
    final isSpace = keysPressed.contains(LogicalKeyboardKey.arrowUp);
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp) && isKeyDown) {
      world!.onPress(Vector2(0, 18));
      print(4321);

    }
    else if (keysPressed.contains(LogicalKeyboardKey.arrowRight) && isKeyDown) {
      world!.onPress(Vector2(30, 0));
      print(1234);

    }
      return KeyEventResult.handled;

  }


}


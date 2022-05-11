import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_snake/screens/game_over_menu.dart';

import '../game/snake_game.dart';

SnakeGame _sneakGame = SnakeGame();

class GamePlay extends StatelessWidget{
  const GamePlay({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.ibb.co/sjQTp4s/eden-Garden.png"),
              fit: BoxFit.fill
          ),
        ),
        child: WillPopScope(
          onWillPop: () async =>false,
          child: GameWidget(
            game: SnakeGame(),
            overlayBuilderMap: {
              GameOverMenu.ID: (BuildContext context, SnakeGame gameRef) => GameOverMenu(gameRef: gameRef),
            },
          ),
        ),
    ),
    );
  }
  
}
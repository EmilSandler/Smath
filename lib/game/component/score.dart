

import 'dart:ui';
import 'dart:ui' hide TextStyle, TextDirection;

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_snake/game/config/game_config.dart';

class Score{
  static int score = 0;
  late TextPainter painter;
  static TextPaint paint = TextPaint(style: const TextStyle(
  color: Colors.red,
  fontFamily: 'Arial',
  fontSize: 24,
  ));


  static void render(Canvas canvas, Vector2 location) {

    paint.render(canvas, score.toString(), Vector2(GameConfig.columns*GameConfig.cellSize.toDouble()-5,0));
  }



  }
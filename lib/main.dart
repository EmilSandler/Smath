import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_snake/game/snake_game.dart';
import 'package:flutter_flame_snake/screens/main_menu.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.bungeeInlineTextTheme(),
        scaffoldBackgroundColor: Colors.black
      ),
      home: const MainMenu(),
    )
  );
}

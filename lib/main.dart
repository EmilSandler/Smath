import 'dart:js';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_snake/game/snake_game.dart';
import 'package:flutter_flame_snake/screens/game_play.dart';
import 'package:flutter_flame_snake/screens/main_menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_snake/screens/game_play.dart';

void main() {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.bungeeInlineTextTheme(),
        scaffoldBackgroundColor: Colors.black
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Background Image - FlutterCorner"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.ibb.co/sjQTp4s/eden-Garden.png"),
              fit: BoxFit.fill
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: Text(
                      'S-Math',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.white,
                            offset: Offset(0, 0),
                          )
                        ],
                      )
                  ),
                ),
                SizedBox(
                 // width: MediaQuery.of(context).size.width / 6,
                child: Stack (
                    children: <Widget>[
                    Builder(
                      builder: (context) {
                        return ElevatedButton(
                              onPressed: () {
                                //Push and replace current screen (i.e MainMenu) with
                                //SelectSpaceship(), so that player can select a spaceship.
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const GamePlay(),
                                  ),
                                );
                            },
                            child: const Text('Play'),
                          //),
                        );
                      }
                    )
                    ]

                   ),
                  )
                 ],
                ),
          ),
        ),
      ),
    ));
  }

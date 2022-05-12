import 'package:flutter/material.dart';
import 'package:flutter_flame_snake/screens/game_play.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) :super(key: key);

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
                width: MediaQuery.of(context).size.width / 6,
                child: ElevatedButton(
                  onPressed: () {
                    // Push and replace current screen (i.e MainMenu) with
                    // SelectSpaceship(), so that player can select a spaceship.
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const GamePlay(),
                      ),
                    );
                  },
                  child: Text('Play'),
                ),
              ),
            ],
          ),
        ),
    ),
    );
  }
  
}
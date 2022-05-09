

import 'dart:math';



class Problems{
  int x = 0;
  int y = 0;


  Problems initProblems(){
    var rng = Random();
    x = rng.nextInt(20);
    y = rng.nextInt(20);
    return this;
  }
}
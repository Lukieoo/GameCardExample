import 'dart:math';

import 'Character.dart';

class Fight{
final Character character1,character2;

  Fight(
      this.character1,
      this.character2,
  );

  void startFight(){

    var rng = new Random();
    var war=rng.nextInt(100);
    
    if(character1.Szansa >war){
      character2.HP-=character1.Moc;
    } 
    if(character2.Szansa >war){
      character1.HP-=character2.Moc;
    }
  }

}
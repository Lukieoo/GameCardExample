import 'dart:math';

import 'Character.dart';

class Fight {
  final Character character1, character2;

  Fight(
    this.character1,
    this.character2,
  );

  void startFight() {
    var rng = new Random();
    var war = rng.nextInt(100);

    if (character1.Mana > character1.Moc) {
      if (character1.Szansa > war) {
        character2.HP -= character1.Moc;
         if(war==1){
            character2.HP -= character1.Moc*2;
        }
      }
      character1.Mana -= character1.Moc;
    }

    war = rng.nextInt(100);
    
    if (character1.Mana > character1.Moc) {
      if (character2.Szansa > war) {
        character1.HP -= character2.Moc;
        if(war==1){
            character1.HP -= character2.Moc*2;
        }
      }
      character2.Mana -= character2.Moc;
    }
    character1.Mana += character1.Moc~/2 ;
    character2.Mana += character2.Moc~/2;
    
    if(character2.Mana>200)character2.Mana=200;
    if(character1.Mana>200)character1.Mana=200;
  }
}

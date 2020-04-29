import 'dart:math';

import 'Character.dart';
import 'Kind_Enum.dart';

class Fight {
  final Character character1, character2;

  Fight(
    this.character1,
    this.character2,
  );

  void startFight() {
    var rng = new Random();
    var war = rng.nextInt(100);

    //Gracz 1 walka
    switch (character1.Kind) {
      case NameKind.magBurzy:
        {
          if (character1.Mana > character1.Power) {
            if (character1.Effectiveness > war) {
              var punch = (character1.Power * (1.0 - character2.Armor / 100));
              character2.HP -= punch.toInt();

              character2.isHit = true;

              if (war == 1) {
                character2.HP -= character1.Power * 2;
              }
            } else {
              character2.isHit = false;
            }
            character1.Mana -= character1.Power ~/ 2;
          }
          break;
        }
      case NameKind.druid:
        {
          if (character1.Mana > character1.Power) {
            if (character1.Effectiveness > war) {
              var punch = (character1.Power * (1.0 - character2.Armor / 100));
              character2.HP -= punch.toInt();
              character2.isHit = true;

              if (war == 1) {
                character2.HP -= character1.Power * 2;
              }
            }
            character1.Mana -= character1.Power ~/ 2;
          } else {
            character2.isHit = false;
          }
          break;
        }
      case NameKind.wojownik:
        {
          if (character1.Condition > character1.Power) {
            if (character1.Effectiveness > war) {
              var punch = (character1.Power * (1.0 - character2.Armor / 100));
              character2.HP -= punch.toInt();
              character2.isHit = true;

              if (war == 1) {
                character2.HP -= character1.Power * 2;
              }
            } else {
              character2.isHit = false;
            }
            character1.Condition -= character1.Power ~/ 2;
          }
          break;
        }
    }

    war = rng.nextInt(100);

    //Gracz 2 walka
    switch (character2.Kind) {
      case NameKind.magBurzy:
        {
          if (character2.Mana > character2.Power) {
            if (character2.Effectiveness > war) {
              var punch = (character2.Power * (1.0 - character1.Armor / 100));
              character1.HP -= punch.toInt();
              character1.isHit = true;
              if (war == 1) {
                character1.HP -= character2.Power * 2;
              }
            }
            character2.Mana -= character2.Power ~/ 2;
          } else {
            character1.isHit = false;
          }
          break;
        }
      case NameKind.druid:
        {
          if (character2.Mana > character2.Power) {
            if (character2.Effectiveness > war) {
              var punch = (character2.Power * (1.0 - character1.Armor / 100));
              character1.HP -= punch.toInt();
              character1.isHit = true;
              if (war == 1) {
                character1.HP -= character2.Power * 2;
              }
            } else {
              character1.isHit = false;
            }
            character2.Mana -= character2.Power ~/ 2;
          }
          break;
        }
      case NameKind.wojownik:
        {
          if (character2.Condition > character2.Power) {
            if (character2.Effectiveness > war) {
              var punch = (character2.Power * (1.0 - character1.Armor / 100));
              character1.HP -= punch.toInt();
              character1.isHit = true;
              if (war == 1) {
                character1.HP -= character2.Power * 2;
              }
            } else {
              character1.isHit = false;
            }
            character2.Condition -= character2.Power ~/ 2;
          }
          break;
        }
    }

    //Gracz 1 przyrost kondycji/many
    switch (character1.Kind) {
      case NameKind.magBurzy:
        {
          character1.Mana += character1.Power ~/ 3;
          break;
        }
      case NameKind.druid:
        {
          character1.Mana += character1.Power ~/ 3;
          break;
        }
      case NameKind.wojownik:
        {
          character1.Condition += character1.Power ~/ 3;
          break;
        }
    }
    //Gracz 2 przyrost kondycji/many
    switch (character2.Kind) {
      case NameKind.magBurzy:
        {
          character2.Mana += character2.Power ~/ 3;
          break;
        }
      case NameKind.druid:
        {
          character2.Mana += character2.Power ~/ 3;
          break;
        }
      case NameKind.wojownik:
        {
          character2.Condition += character2.Power ~/ 3;
          break;
        }
    }

    //Gracz 1 blokada many/kondycji
    switch (character1.Kind) {
      case NameKind.magBurzy:
        {
          if (character1.Mana > character1.ManaCp)
            character1.Mana = character1.ManaCp;
          break;
        }
      case NameKind.druid:
        {
          if (character1.Mana > character1.ManaCp)
            character1.Mana = character1.ManaCp;
          break;
        }
      case NameKind.wojownik:
        {
          if (character1.Condition > character1.ConditionCp)
            character1.Condition = character1.ConditionCp;
          break;
        }
    }
    //Gracz 2 blokada many/kondycji
    switch (character2.Kind) {
      case NameKind.magBurzy:
        {
          if (character2.Mana > character2.ManaCp)
            character2.Mana = character2.ManaCp;
          break;
        }
      case NameKind.druid:
        {
          if (character2.Mana > character2.ManaCp)
            character2.Mana = character2.ManaCp;
          break;
        }
      case NameKind.wojownik:
        {
          if (character2.Condition > character2.ConditionCp)
            character2.Condition = character2.ConditionCp;
          break;
        }
    }
  }
}

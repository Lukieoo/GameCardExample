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
              character2.HP -= character1.Power;
              if (war == 1) {
                character2.HP -= character1.Power * 2;
              }
            }
            character1.Mana -= character1.Power;
          }
          break;
        }
      case NameKind.druid:
        {
          if (character1.Mana > character1.Power) {
            if (character1.Effectiveness > war) {
              character2.HP -= character1.Power;
              if (war == 1) {
                character2.HP -= character1.Power * 2;
              }
            }
            character1.Mana -= character1.Power;
          }
          break;
        }
      case NameKind.wojownik:
        {
          if (character1.Condition > character1.Power) {
            if (character1.Effectiveness > war) {
              character2.HP -= character1.Power;
              if (war == 1) {
                character2.HP -= character1.Power * 2;
              }
            }
            character1.Condition -= character1.Power;
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
              character1.HP -= character2.Power;
              if (war == 1) {
                character1.HP -= character2.Power * 2;
              }
            }
            character2.Mana -= character2.Power;
          }
          break;
        }
      case NameKind.druid:
        {
          if (character2.Mana > character2.Power) {
            if (character2.Effectiveness > war) {
              character1.HP -= character2.Power;
              if (war == 1) {
                character1.HP -= character2.Power * 2;
              }
            }
            character2.Mana -= character2.Power;
          }
          break;
        }
      case NameKind.wojownik:
        {
          if (character2.Condition > character2.Power) {
            if (character2.Effectiveness > war) {
              character1.HP -= character2.Power;
              if (war == 1) {
                character1.HP -= character2.Power * 2;
              }
            }
            character2.Condition -= character2.Power;
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
          if (character1.Mana > 400) character1.Mana = 400;
          break;
        }
      case NameKind.druid:
        {
          if (character1.Mana > 400) character1.Mana = 400;
          break;
        }
      case NameKind.wojownik:
        {
          if (character1.Condition > 400) character1.Condition = 400;
          break;
        }
    }
    //Gracz 2 blokada many/kondycji
    switch (character2.Kind) {
      case NameKind.magBurzy:
        {
          if (character2.Mana > 400) character2.Mana = 400;
          break;
        }
      case NameKind.druid:
        {
          if (character2.Mana > 400) character2.Mana = 400;
          break;
        }
      case NameKind.wojownik:
        {
          if (character2.Condition > 400) character2.Condition = 400;
          break;
        }
    }
  }
}

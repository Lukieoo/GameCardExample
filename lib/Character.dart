class Character {
  String Nick;
  int HP;
  int Mana;
  int Condition;
  int Power;
  int Effectiveness;
  int Armor;
  var Kind;

  var isHit = false;

  String NickCp = "";
  int HPCp = 0;
  int ManaCp = 0;
  int ConditionCp = 0;
  int PowerCp = 0;
  int EffectivenessCp = 0;
  int ArmorCp = 0;
  var KindCp;

  var isHitCp = false;

  Character({
    required this.Nick,
    required this.HP,
    required this.Mana,
    required this.Condition,
    required this.Power,
    required this.Effectiveness,
    required this.Armor,
    this.Kind,
    this.isHit = false,
  }) {
    copyCharacter();
  }

  copyCharacter() {
    NickCp = Nick;
    HPCp = HP;
    ManaCp = Mana;
    ConditionCp = Condition;
    PowerCp = Power;
    EffectivenessCp = Effectiveness;
    ArmorCp = Armor;
    KindCp = Kind;
    isHitCp = isHit;
  }

  returnCharacter() {
    Nick = NickCp;
    HP = HPCp;
    Mana = ManaCp;
    Condition = ConditionCp;
    Power = PowerCp;
    Effectiveness = EffectivenessCp;
    Armor = ArmorCp;
    Kind = KindCp;
    isHit = isHitCp;
  }
}

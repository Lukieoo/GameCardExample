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

  String NickCp;
  int HPCp;
  int ManaCp;
  int ConditionCp;
  int PowerCp;
  int EffectivenessCp;
  int ArmorCp;
  var KindCp;

  var isHitCp= false;

  Character({
    this.Nick,
    this.HP,
    this.Mana,
    this.Condition,
    this.Power,
    this.Effectiveness,
    this.Armor,
    this.Kind,
    this.isHit=false,
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

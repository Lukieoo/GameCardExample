
enum NameKind{
  magBurzy,
  wojownik,
  druid,
}

kindToName(NameKind skill){
  switch (skill) {
    case NameKind.magBurzy:
      return "Mag Burzy";
    case NameKind.wojownik:
      return "Wojownik";
     case NameKind.druid:
      return "Druid";
    default:
      return "No name";
  }
}
kindToSkill(NameKind skill){
  switch (skill) {
    case NameKind.magBurzy:
      return "Piorun";
    case NameKind.wojownik:
      return "Mocne Uderzenie";
     case NameKind.druid:
      return "Leczenie";
    default:
      return "No name";
  }
}
kindToPower(NameKind skill){
  switch (skill) {
    case NameKind.magBurzy:
      return 50;
    case NameKind.wojownik:
      return 60;
     case NameKind.druid:
      return 50;
    default:
      return "No name";
  }

}
import 'package:flutter/material.dart';

class CardGame extends StatefulWidget {
 final String Asset,HP,Mana , Moc , Szansa;

  const CardGame({
    this.Asset,this.HP, this.Mana ,this.Moc ,this.Szansa
  }) ;

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 50.0,
        left: 50.0,
        top: 10.0
      ),
      child: Card(
        color: Colors.black45,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            width: double.infinity,
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0) 
                      ),
                      child: Image(
                          image: AssetImage(widget.Asset),
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Text("HP : ${widget.HP}",style: TextStyle(color: Colors.white)),
                  Text("Mana : ${widget.Mana}",style: TextStyle(color: Colors.white)),
                  Text("Moc : ${widget.Moc}",style: TextStyle(color: Colors.white)),
                  Text("Szansa : ${widget.Szansa} %",style: TextStyle(color: Colors.white)),

              ],


            ),
                )),
          ),
        ),
      ),
    );
  }
}

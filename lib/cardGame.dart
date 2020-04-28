import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myflutek/Character.dart';

class CardGame extends StatefulWidget {
  final Character character;

  const CardGame({this.character});

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0, left: 50.0, top: 10.0),
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
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(widget.character.Asset),
                fit: BoxFit.cover,
              )),
              width: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      child: Image(
                                          image: AssetImage(
                                              widget.character.Asset),
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.bottomLeft,
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Stack(children: <Widget>[
                                          Image(
                                              image: AssetImage(
                                                  "assets/power.png"),
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.contain),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "${widget.character.Power}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0)),
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 5, top: 10, bottom: 0),
                                      alignment: Alignment.bottomRight,
                                      child: SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: Stack(children: <Widget>[
                                          Image(
                                              image: AssetImage(
                                                  "assets/shield.png"),
                                              width: 45,
                                              height: 45,
                                              fit: BoxFit.contain),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "${widget.character.Armor}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0)),
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            child: SizedBox(
                              width: double.infinity,
                              child: Stack(children: <Widget>[
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: Container(
                                    child: SizedBox(
                                      
                                      child: Stack(
                                        children: <Widget>[
                                            Container(
                                            width: ((widget.character.HP>0)?240*(widget.character.HP/1000):1),
                                            alignment: Alignment.topLeft,
                                            color: Color(0xAAd32f2f)
                                                .withOpacity(0.9),
                                            child: Text(
                                                "",
                                                 ),
                                          ),
                                         
                                          Container(
                                            alignment: Alignment.center,
                                            color: Color(0xFF7f0000)
                                                .withOpacity(0.5),
                                            child: Text(
                                                "HP : ${widget.character.HP}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Pacifico')),
                                          ),
                                         
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Text("Mana : ${widget.character.Mana}",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Pacifico')),
                        Text("Kondycja : ${widget.character.Condition}",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Pacifico')),
                        Text("Szansa : ${widget.character.Effectiveness} %",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Pacifico')),
                      ],
                    ),
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

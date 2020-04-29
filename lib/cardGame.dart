import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myflutek/Character.dart';

import 'Kind_Enum.dart';

class CardGame extends StatefulWidget {
  final Character character;
  final Character oponnet;

  const CardGame({this.character,this.oponnet});

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
                image: AssetImage(kindToAsset(widget.character.Kind)),
                fit: BoxFit.cover,
              )),
              width: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
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
                                          image: AssetImage(kindToAsset(
                                              widget.character.Kind)),
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                          alignment: new Alignment(-1.0, -1.0)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        widget.character.Nick,
                                        style: TextStyle(
                                          color: Colors.black,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(1.0, 1.0),
                                              blurRadius: 3.0,
                                              color:
                                                  Color.fromARGB(255, 0, 140, 0),
                                            ),
                                            Shadow(
                                              offset: Offset(1.0, 1.0),
                                              blurRadius: 8.0,
                                              color:
                                                  Color.fromARGB(255, 0, 140, 0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    AnimatedOpacity(
                                      opacity: widget.oponnet.isHit ? 1.0 : 0.0,
                                      duration: Duration(milliseconds: 500),
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: RotatedBox(
                                          quarterTurns: 0,
                                          child: Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: AssetImage(kindToSkill(
                                                    widget.character.Kind)),
                                              ))),
                                        ),
                                      ),
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
                                          right: 5, top: 15, bottom: 0),
                                      alignment: Alignment.bottomRight,
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Stack(children: <Widget>[
                                          Image(
                                              image: AssetImage(
                                                  "assets/shield.png"),
                                              width: 40,
                                              height: 40,
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
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Stack(children: <Widget>[
                                          Image(
                                              image: AssetImage(
                                                  "assets/archer.png"),
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.contain),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "${widget.character.Effectiveness}",
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
                              width: 200,
                              child: Stack(children: <Widget>[
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: Container(
                                    child: SizedBox(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            width: ((widget.character.HP > 0)
                                                ? 200 *
                                                    (widget.character.HP /
                                                        widget.character.HPCp)
                                                : 1),
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
                                                    fontFamily: 'Bangers')),
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
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            child: SizedBox(
                              width: 200,
                              child: Stack(children: <Widget>[
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: Container(
                                    child: SizedBox(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            width: ((widget.character.Mana > 0)
                                                ? 200 *
                                                    (widget.character.Mana /
                                                        widget.character.ManaCp)
                                                : 1),
                                            alignment: Alignment.topLeft,
                                            color: Color(0xAA1565c0)
                                                .withOpacity(0.9),
                                            child: Text(
                                              "",
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            color: Color(0xFF002171)
                                                .withOpacity(0.5),
                                            child: Text(
                                                "Mana : ${widget.character.Mana}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Bangers')),
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
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            child: SizedBox(
                              width: 200,
                              child: Stack(children: <Widget>[
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: Container(
                                    child: SizedBox(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            width:
                                                ((widget.character.Condition >
                                                        0)
                                                    ? 200 *
                                                        (widget.character
                                                                .Condition /
                                                            widget.character
                                                                .ConditionCp)
                                                    : 1),
                                            alignment: Alignment.topLeft,
                                            color: Color(0xAA558b2f)
                                                .withOpacity(0.9),
                                            child: Text(
                                              "",
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            color: Color(0xFF33691e)
                                                .withOpacity(0.5),
                                            child: Text(
                                                "Kondycja : ${widget.character.Condition}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Bangers')),
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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myflutek/Fight.dart';

import 'Character.dart';
import 'Kind_Enum.dart';
import 'cardGame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FightMagicka',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Pacifico'),
      home: MyHomePage(title: 'Magicka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Character character1 = new Character(
      Asset: "assets/magicka.jpg",
      HP: 1000,
      Mana: 450,
      Condition: 200,
      Power: 240,
      Effectiveness: 55,
      Armor: 11,
      Kind: NameKind.wojownik);
  Character character2 = new Character(
      Asset: "assets/warrior.jpg",
      HP: 1000,
      Mana: 450,
      Condition: 200,
      Power: 200,
      Effectiveness: 60,
      Armor: 12,
      Kind: NameKind.druid);

  void _incrementCounter() {
    setState(() {
      var fight = Fight(character1, character2);
      fight.startFight();
      print(character1.HP);
      print(character2.HP);
    });
  }

  void _reset() {
    setState(() {
      character1 = new Character(
          Asset: "assets/magicka.jpg",
          HP: 1000,
          Mana: 450,
          Condition: 200,
          Power: 240,
          Effectiveness: 55,
          Armor: 11,
          Kind: NameKind.wojownik);
      character2 = new Character(
          Asset: "assets/warrior.jpg",
          HP: 1000,
          Mana: 450,
          Condition: 200,
          Power: 200,
          Effectiveness: 60,
          Armor: 12,
          Kind: NameKind.druid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_backup_restore),
            onPressed: () {
              _reset();
            },
          ),
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/forest.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          // color: Colors.brown,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.4)),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    // horizontal).
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CardGame(
                        character: character1,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _incrementCounter();
                          if (character1.HP <= 0 || character2.HP <= 0) {
                            var winner =
                                (character1.HP <= 0) ? "Hero Down" : "Hero Up";
                            var winner2 =
                                (character2.HP <= 0) ? "Hero Up" : "Hero Down";

                            if (winner != winner2) {
                              winner = "Remis";
                            }

                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Zwycięzcom zostaje"),
                                  content: Text(winner),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _reset();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text("VS"),
                      ),
                      CardGame(
                        character: character2,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

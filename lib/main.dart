import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myflutek/Fight.dart';

import 'Character.dart';
import 'Kind_Enum.dart';
import 'CardGame.dart';

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
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Bangers'),
      home: MyHomePage(title: 'Magicka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
  Timer? _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (character1.HP <= 0 || character2.HP <= 0) {
            var winner = (character1.HP <= 0) ? character2.Nick : character1.Nick;
            var winner2 = (character2.HP <= 0) ? character1.Nick : character2.Nick;

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
                    ElevatedButton(
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

            timer.cancel();
            _start = 0;
          } else {
            _incrementCounter();
            _start = _start + 1;
          }
        },
      ),
    );
  }

  Character character1 = new Character(
      Nick: "Zaforia",
      HP: 10000,
      Mana: 200,
      Condition: 8000,
      Power: 840,
      Effectiveness: 60,
      Armor: 25,
      Kind: NameKind.wojownik);

  Character character2 = new Character(
      Nick: "Wertusa",
      HP: 15000,
      Mana: 9050,
      Condition: 200,
      Power: 750,
      Effectiveness: 95,
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

  bool _visible = true;

  void _reset() {
    setState(() {
      _visible = !_visible;
      character1.returnCharacter();
      character2.returnCharacter();
      _timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003300).withOpacity(0.6),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/arena.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          // color: Colors.brown,
          child: Center(
            child: Container(
              //  decoration: BoxDecoration(color: Colors.white.withOpacity(0.4)),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    // horizontal).
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CardGame(
                        character: character1,
                        oponnet: character2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          AnimatedOpacity(
                            opacity: _visible ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: FloatingActionButton(
                              onPressed: () {
                                if (_visible) {
                                  startTimer();

                                  setState(() {
                                    _visible = !_visible;
                                  });
                                }
                              },
                              child: Text("Fight"),
                            ),
                          ),
                        ],
                      ),
                      CardGame(
                        character: character2,
                        oponnet: character1,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roller_dice/EnterName.dart';
import 'package:roller_dice/Game.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
      fixedSize: const Size(250, 90),
      backgroundColor: const Color.fromARGB(218, 14, 2, 2));

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return CupertinoPageScaffold(
      child: MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                shadowColor: const Color.fromARGB(255, 56, 212, 8),
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                title: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text('Roller Diec',
                      style: TextStyle(
                          fontFamily: AutofillHints.addressCity,
                          fontSize: 30,
                          fontWeight: FontWeight.w500)),
                ),
                centerTitle: true,
              )),
          body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const EnterName()));
              },
              child: const Text('PLAY'),
            )
          ])),
          backgroundColor: const Color.fromARGB(255, 235, 246, 221),
        ),
      ),
    );
  }
}

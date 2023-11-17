import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roller_dice/Game.dart';

class EnterName extends StatefulWidget {
  const EnterName({super.key});

  @override
  State<EnterName> createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  var playerOne;
  var playerTwo;

  @override
  Widget build(BuildContext context) {
    final textControllerOne = TextEditingController();
    final textControllerTwo = TextEditingController();
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
                  child: Text('Enter The Names',
                      style: TextStyle(
                          fontFamily: AutofillHints.addressCity,
                          fontSize: 30,
                          fontWeight: FontWeight.w500)),
                ),
                centerTitle: true),
          ),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextField(
                      controller: textControllerOne,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Name of Player #1',
                          suffixIcon: IconButton(
                              onPressed: () {
                                textControllerOne.clear();
                              },
                              icon: const Icon(Icons.clear))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: TextField(
                      controller: textControllerTwo,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Name of Player #2',
                          suffixIcon: IconButton(
                              onPressed: () {
                                textControllerTwo.clear();
                              },
                              icon: const Icon(Icons.clear))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => Game(playerOne: Text(textControllerOne.text), playerTwo: Text(textControllerTwo.text))));
                      },
                      style: TextButton.styleFrom(
                          fixedSize: const Size(250, 60),
                          backgroundColor:
                              const Color.fromARGB(255, 16, 16, 15),
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 30,
                          )),
                      child: const Text('Let \'s Roll'),
                    ),
                  )
                ],
              )),
              backgroundColor: const Color.fromARGB(255, 235, 246, 221),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roller_dice/EnterName.dart';
import 'package:roller_dice/Game.dart';

class Won extends StatelessWidget {
  String playerName;
  var total;
  String playerTwo;

  Won(this.playerName, this.playerTwo, this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              shadowColor: const Color.fromARGB(255, 56, 212, 8),
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text('Winner Status',
                    style: TextStyle(
                        fontFamily: AutofillHints.addressCity,
                        fontSize: 30,
                        fontWeight: FontWeight.w500)),
              ),
              centerTitle: true,
            )),
        body: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Text(
                playerName,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                'Points',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                total.toString(),
                style: const TextStyle(fontSize: 100),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
            //   child: TextButton(
            //       onPressed: () {
            //             Navigator.push(
            //         context,
            //         CupertinoPageRoute(
            //             builder: (context) =>  Game(playerOne: playerName, playerTwo: playerTwo,)));
            //           },
            //       style: TextButton.styleFrom(
            //           backgroundColor: Colors.amber,
            //           fixedSize: const Size(300, 60),
            //           foregroundColor: Colors.black),
            //       child: const Text(
            //         'Play Agin',
            //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            //       )),
            // ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const EnterName()));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      fixedSize: const Size(300, 60),
                      foregroundColor: Colors.black),
                  child: const Text('New Game',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700))),
            )
          ]),
        ),
      ),
    );
  }
}

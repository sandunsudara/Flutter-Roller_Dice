import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roller_dice/Won.dart';
import 'package:collection/collection.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flame_audio/flame_audio.dart';

class Game extends StatefulWidget {
  var playerOne;
  var playerTwo;

  Game({Key? key, this.playerOne, this.playerTwo}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var tittleText = const TextStyle(
      fontWeight: FontWeight.w700, color: Color.fromARGB(255, 255, 255, 255));
  var text = const TextStyle(color: Color.fromARGB(255, 255, 255, 255));
  var side = 0;
  late List<int> pointOne = [0, 0, 0, 0];
  late List<int> pointTwo = [0, 0, 0, 0];
  int time = 0;
  bool isBtnActiveOne = true;
  bool isBtnActiveTwo = false;

  @override
  Widget build(BuildContext context) {
    String currentPlayerOne = widget.playerOne.data;
    String currentPlayerTwo = widget.playerTwo.data;

    return MaterialApp(
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: Table(
                border: TableBorder.all(
                    color: const Color.fromARGB(255, 56, 212, 8)),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      children: [
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 2, 0, 2),
                                child: Text('Round', style: tittleText))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(
                                  '#1',
                                  style: text,
                                ))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(
                                  '#2',
                                  style: text,
                                ))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text('#3', style: text))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text('#4', style: text)))
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 7, 0, 7),
                                child: Text(
                                  currentPlayerOne,
                                  style: tittleText,
                                ))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(pointOne.elementAt(0).toString(),
                                    style: text))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(pointOne.elementAt(1).toString(),
                                    style: text))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(pointOne.elementAt(2).toString(),
                                    style: text))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(pointOne.elementAt(3).toString(),
                                    style: text)))
                      ]),
                  TableRow(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 7, 0, 7),
                                child:
                                    Text(currentPlayerTwo, style: tittleText))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(pointTwo.elementAt(0).toString(),
                                    style: text))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(pointTwo.elementAt(1).toString(),
                                    style: text))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(pointTwo.elementAt(2).toString(),
                                    style: text))),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                                child: Text(pointTwo.elementAt(3).toString(),
                                    style: text))),
                      ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
              child: Image.asset('assets/image/side-$side.png', width: 300),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: isBtnActiveOne
                          ? () {
                              rollerOne();
                            }
                          : null,
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 16, 16, 15),
                          foregroundColor: Colors.white,
                          fixedSize: const Size(160, 60),
                          textStyle: const TextStyle(fontSize: 30)),
                      child: const Text('Roll #1')),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: isBtnActiveTwo
                          ? () {
                              rollerTwo(currentPlayerOne, currentPlayerTwo);
                            }
                          : null,
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 16, 16, 15),
                          foregroundColor: Colors.white,
                          fixedSize: const Size(160, 60),
                          textStyle: const TextStyle(fontSize: 30)),
                      child: const Text('Roll #2')),
                )
              ],
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 235, 246, 221),
      ),
    );
  }

  void rollerOne() {
    setState(() {
      isBtnActiveOne = false;
      isBtnActiveTwo = true;
      side = Random().nextInt(6) + 1;
      pointOne.insert(time, side);
    });
  }

  void rollerTwo(String currentPlayerOne, String currentPlayerTwo) {
    setState(() {
      isBtnActiveOne = true;
      isBtnActiveTwo = false;
      side = Random().nextInt(6) + 1;
      pointTwo.insert(time++, side);
      if (time == 4) {
        isBtnActiveOne = false;
        int totalOne = pointOne.sum;
        int totalTwo = pointTwo.sum;

        print(totalOne);
        print(totalTwo);

        if (totalOne > totalTwo) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      Won('Winner is $currentPlayerOne', currentPlayerTwo, totalOne)));
        } else if (totalOne == totalTwo) {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => Won('Points Equal', 'No', totalOne)));
        } else {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      Won('Winner is $currentPlayerTwo', currentPlayerOne, totalTwo)));
        }
      }
    });
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 5;
  var rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () {
                  changeDiceFace();
                  print("You clicked on the left image");
                },
                child: Image.asset('assets/images/dice$leftDiceNumber.png')),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('assets/images/dice$rightDiceNumber.png')),
          ),
        ],
      ),
    );
  } //
}

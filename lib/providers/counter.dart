import 'package:flutter/material.dart';

class Counter with ChangeNotifier {

  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}
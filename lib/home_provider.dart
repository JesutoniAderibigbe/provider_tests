import 'package:flutter/material.dart';

class NumberListProvider extends ChangeNotifier{


  List numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];



  void addNumber(){
    numbers.add(numbers.last + 1);
    notifyListeners();
  }



}
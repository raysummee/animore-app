import 'package:flutter/material.dart';

class PetSelectNotify extends ChangeNotifier{
  int _id = 1;

  int get id=>_id;

  set id(int index){
    _id = index;
    notifyListeners();
  }
}
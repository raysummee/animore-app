import 'package:flutter/material.dart';

class PetSelectNotify extends ChangeNotifier{
  int _id;

  int get id=>_id;

  set id(int index){
    _id = index;
    notifyListeners();
  }
}
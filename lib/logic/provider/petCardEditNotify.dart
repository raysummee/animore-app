import 'package:flutter/material.dart';

class PetCardEditNotify extends ChangeNotifier{
  bool _isEditing = false;

  bool get isEditing => _isEditing;

  set isEditing(bool isEditing){
    _isEditing = isEditing;
    notifyListeners();
  }
}
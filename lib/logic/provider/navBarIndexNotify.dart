import 'package:flutter/foundation.dart';

class NavBarIndexNotify extends ChangeNotifier{
  int _index = 0;

  int get index=> _index;

  set index(int index){
    _index = index;
    notifyListeners();
  }

}
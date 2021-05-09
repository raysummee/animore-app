import 'package:animore/logic/util/dateUtil.dart';
import 'package:flutter/material.dart';

class WeekSelectNotify extends ChangeNotifier{
  String _weekName = "";
  int _index = 0;

  WeekSelectNotify(){
    const List<String> weeks = ["mon", "tue", "wed", "thus", "fri", "sat", "sun"];
    _weekName = DateUtil().todayWeekName().toLowerCase();
    _index = weeks.indexWhere((element) => element==_weekName);
  }

  int get index => _index;

  set index(int index){
    _index = index;
    notifyListeners();
  }

  String get weekName => _weekName;

  set weekName(String weekName){
    _weekName = weekName;
    notifyListeners();
  }

}
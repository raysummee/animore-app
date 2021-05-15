import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil{
  String todayWeekName(){
    DateTime dateToday = DateTime.now();
    var weekName = DateFormat(DateFormat.ABBR_WEEKDAY).format(dateToday);
    return weekName;
  }

  String tomorrowWeekName(){
    DateTime dateToday = DateTime.now();
    dateToday = dateToday.add(Duration(days: 1));
    var weekName = DateFormat(DateFormat.ABBR_WEEKDAY).format(dateToday);
    return weekName;
  }

  String weekName(DateTime date){
    var weekName = DateFormat(DateFormat.ABBR_WEEKDAY).format(date);
    return weekName;   
  }

  DateTime toDateTime(TimeOfDay timeOfDay){
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  DateTime toDateTimeString(String dateTime){
    List<String> dateFormat = [
      "dd/mm/yyyy", "dd/mm/yy", "dd/m/yyyy", "dd/m/yy", "d/mm/yyyy", "d/mm/yy", "d/m/yyyy", "d/m/yy",
      "dd-mm-yyyy", "dd-mm-yy", "dd-m-yyyy", "dd-m-yy", "d-mm-yyyy", "d-mm-yy", "d-m-yyyy", "d-m-yy"
    ];
    DateTime date;
    dateFormat.forEach((element) { 
      if(date==null){
        date = DateFormat("dd/mm/yyyy").parseLoose(dateTime);
        if(date!=null){
          return date;
        }
      }
    });
    return date;
  }
}
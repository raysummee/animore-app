import 'package:intl/intl.dart';

class DateUtil{
  String getTodayWeekName(){
    DateTime dateToday = DateTime.now();
    // dateToday = dateToday.add(Duration(days: 1));
    var weekName = DateFormat(DateFormat.ABBR_WEEKDAY).format(dateToday);
    return weekName;
  }
}
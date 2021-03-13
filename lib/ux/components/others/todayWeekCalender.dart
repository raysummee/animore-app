import 'package:animore/logic/util/dateUtil.dart';
import 'package:flutter/material.dart';

class TodayWeekCalender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,8,8,8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.calendar_today,
              size: 26,
              color: Colors.white
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              "${DateUtil().getTodayWeekName().toUpperCase()}",
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      )
    );
  }
}
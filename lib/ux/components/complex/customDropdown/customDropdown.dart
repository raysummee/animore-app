import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomDropdown extends StatelessWidget {
  final List items;
  CustomDropdown(this.items);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: (){},
        child: Row(
          children: [
            Text(
              "MON", 
              style: TextStyle(color: Colors.black),
            ),
            Icon(FlutterIcons.arrow_drop_down_mdi, color: Colors.black,)
          ],
        ),
      ),
    );
  }
}
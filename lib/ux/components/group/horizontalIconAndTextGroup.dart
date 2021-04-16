import 'package:flutter/material.dart';

class HorizontalIconAndTextGroup extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  HorizontalIconAndTextGroup(this.text, this.icon, {this.iconColor:Colors.green});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Icon(icon, color: Colors.white, size: 12,),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                child: Text(
                  text
                ),
              )
            )
          ],
        ),
    );
  }
}
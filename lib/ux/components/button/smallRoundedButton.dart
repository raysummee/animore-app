import 'package:flutter/material.dart';

class SmallRoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  SmallRoundedButton(this.title, this.onClick);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        minimumSize: Size(80, 38),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onClick,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white
        ),
      ),
    );
  }
}
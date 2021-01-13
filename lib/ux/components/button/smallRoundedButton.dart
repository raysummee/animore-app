import 'package:flutter/material.dart';

class SmallRoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  SmallRoundedButton(this.title, this.onClick);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: RaisedButton(
        onPressed: onClick,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
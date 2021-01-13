import 'package:flutter/material.dart';

class OvalBigButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  OvalBigButton(this.title, this.onClick);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 180,
      height: 55,
      buttonColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: RaisedButton(
        onPressed: onClick,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}
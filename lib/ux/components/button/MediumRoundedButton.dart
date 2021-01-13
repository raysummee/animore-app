import 'package:flutter/material.dart';

class MediumRoundedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 140,
      height: 42,
      buttonColor: Colors.cyan,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: RaisedButton(
        onPressed: (){},
        child: Text(
          "Read more",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
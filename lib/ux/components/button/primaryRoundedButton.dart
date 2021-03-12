import 'package:flutter/material.dart';

class PrimaryRoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  PrimaryRoundedButton({@required this.label, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 65),
          primary: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35)
          )
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }
}
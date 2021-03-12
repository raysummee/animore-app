import 'package:flutter/material.dart';

class PrimaryIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color buttonColor;
  final Color color;
  final bool isOutlined;
  PrimaryIconButton({
    @required this.label,
    @required this.icon,
    this.buttonColor:Colors.blue,
    this.color:Colors.white,
    this.isOutlined:false
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton.icon(
        label: Text(
          label,
          style: TextStyle(
            color: color
          ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 65),
          primary: buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: isOutlined? BorderSide(
              width: 0.7,
              color: Colors.black.withOpacity(0.21)
            ):BorderSide.none
          )
        ),
        icon: Icon(icon, color: color,),
        onPressed: (){},
      ),
    );
  }
}
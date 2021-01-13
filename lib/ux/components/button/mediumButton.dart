import 'package:flutter/material.dart';

class MediumButton extends StatelessWidget {
  final String name;
  final VoidCallback onClick;
  final bool isLoading;
  MediumButton(this.onClick,{this.name:"Buy Now", this.isLoading: false});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: Colors.deepOrange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minWidth: 150,
      height: 50,
      child: RaisedButton(
        onPressed: isLoading ? (){} : onClick,
        child: isLoading? 
        SizedBox(
          child: CircularProgressIndicator(),
          height: 30,
          width: 30,
        )
        :Text(
          name,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
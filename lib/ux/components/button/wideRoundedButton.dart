import 'package:flutter/material.dart';

class WideRoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final isLoading;
  WideRoundedButton(this.title, this.onClick, {this.isLoading:false});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: Colors.deepOrange,
      minWidth: double.infinity,
      height:55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: RaisedButton(
        onPressed: isLoading? (){}: onClick,
        child: isLoading? 
        SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )
        )
        : Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17
          ),
        ),
      ),
    );
  }
}
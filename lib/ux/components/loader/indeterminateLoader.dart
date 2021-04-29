import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IndeterminateLoader extends StatelessWidget {
  static GlobalKey<State> _keyLoader;
  static show(BuildContext context){
    if(_keyLoader==null)
      _keyLoader = new GlobalKey<State>();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => IndeterminateLoader()
    );
  }
  static hide(){
    if(_keyLoader!=null){
      Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: WillPopScope(
        onWillPop: () async => false,
        child: SpinKitPulse(
          color: Colors.black,
          size: 50.0,
        ),
      )
    );
  }
}
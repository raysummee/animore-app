import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IndeterminateLoader extends StatelessWidget {
  static GlobalKey<State> _keyLoader;
  static void show(BuildContext context){
    _keyLoader = new GlobalKey<State>();
    hide();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => IndeterminateLoader()
    );
  }
  static void hide(){
    if(_keyLoader!=null
        &&_keyLoader.currentContext!=null
        &&Navigator.of(_keyLoader.currentContext,rootNavigator: true).canPop()
      ){
      Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
    }
    _keyLoader = null;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      key: _keyLoader,
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
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/main.dart';
import 'package:animore/ux/pages/main/navPages.dart';
import 'package:animore/ux/pages/welcome/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Startup extends StatefulWidget {
  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async{
      switch (Auth().user()!=null) {
        case true:
          Navigator.of(navigatorKey.currentContext).pushReplacement(
            MaterialWithModalsPageRoute(builder: (_)=>NavPages())
          );
          break;
        default:
          Navigator.of(navigatorKey.currentContext).pushReplacement(
            MaterialPageRoute(builder: (_)=>WelcomePage())
          );
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/ux/pages/main/navPages.dart';
import 'package:animore/ux/pages/welcome/welcomePage.dart';
import 'package:flutter/material.dart';

class Startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    switch (Auth().user()!=null) {
      case true:
        return NavPages();
        break;
      default:
        return WelcomePage();
    }
  }
}
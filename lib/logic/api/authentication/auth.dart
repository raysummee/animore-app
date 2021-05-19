import 'package:animore/logic/api/authentication/apiAuthentication.dart';
import 'package:animore/logic/model/modelUser.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';
import 'package:animore/ux/components/dialog/infoDialog.dart';
import 'package:animore/ux/components/loader/IndeterminateLoader.dart';
import 'package:animore/ux/pages/main/navPages.dart';
import 'package:animore/ux/pages/welcome/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Auth {
  Future<void> login(String email, String password, BuildContext context) async {
    IndeterminateLoader.show(context);
    if (await ApiAuthentication().loginEmail(email, password, context)) {
      print("succeed");
      IndeterminateLoader.hide();
      Navigator.of(context).pushAndRemoveUntil(MaterialWithModalsPageRoute(builder: (_) => NavPages()), (route) => false);
    } else {
      print("failed");
      IndeterminateLoader.hide();
      InfoDialog.showError(context);

    }
  }

  Future<void> signup(String name, String email, String password,String passwordConfrim, BuildContext context) async {
    IndeterminateLoader.show(context);
    if (await ApiAuthentication().registerEmail(name, email, password, passwordConfrim, context)) {
      print("succeed");
      IndeterminateLoader.hide();
      Navigator.of(context).pushAndRemoveUntil(MaterialWithModalsPageRoute(builder: (_) => NavPages()), (route) => false);
    } else {
      print("failed");
      IndeterminateLoader.hide();
      InfoDialog.showError(context);
    }
  }

  Future<bool> logout(BuildContext context) async {
    print("logging out");
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => WelcomePage()), (route) => false);
    AuthenticationHelper().deleteUser();
    await Hive.deleteFromDisk();
    bool result = await ApiAuthentication().logout();
    print("result: $result");
    return result;
  }

  Future<void> logoutRemote(BuildContext context) async{
    if(user()==null) return false;
    print("remote logout");
    logout(context);
    Future.delayed(Duration(milliseconds: 400), (){
      InfoDialog.show(
        context,
        title: "You've been logout!",
        content: "You're logged out! Please login again to continue the app",
        buttonLabel: "I Understand"
      );
    });
  }

  ModelUser user() {
    return AuthenticationHelper().getUser();
  }
}

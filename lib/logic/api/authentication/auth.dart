import 'package:animore/logic/api/authentication/apiAuthentication.dart';
import 'package:animore/logic/model/modelUser.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';
import 'package:animore/main.dart';
import 'package:animore/ux/components/dialog/remoteLogoutDialog.dart';
import 'package:animore/ux/components/loader/IndeterminateLoader.dart';
import 'package:animore/ux/pages/main/navPages.dart';
import 'package:animore/ux/pages/welcome/welcomePage.dart';
import 'package:flutter/material.dart';

class Auth {
  Future<void> login(String email, String password, BuildContext context) async {
    IndeterminateLoader.show(context);
    if (await ApiAuthentication().loginEmailApiRequest(email, password, context)) {
      print("succeed");
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => NavPages()), (route) => false);
    } else {
      print("failed");
    }
    IndeterminateLoader.hide();
  }

  Future<void> signup(String name, String email, String password,String passwordConfrim, BuildContext context) async {
    IndeterminateLoader.show(context);
    if (await ApiAuthentication().registerEmailApiRequest(name, email, password, passwordConfrim, context)) {
      print("succeed");
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => NavPages()), (route) => false);
    } else {
      print("failed");
    }
    IndeterminateLoader.hide();
  }

  Future<bool> logout(BuildContext context) async {
    print("logging out");
    IndeterminateLoader.show(context);
    await AuthenticationHelper().deleteUser();
    IndeterminateLoader.hide();
    await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => WelcomePage()), (route) => false);
    bool result = await ApiAuthentication().logoutApiRequest();
    print("result: $result");
    return result;
  }

  Future<bool> logoutRemote(BuildContext context) async{
    print("remote logout");
    if(user()==null) return
    logout(context);
    Future.delayed(Duration(milliseconds: 400), (){
      RemoteLogoutDialog.show(context);
    });
    return await logout(context);
  }

  ModelUser user() {
    return AuthenticationHelper().getUser();
  }
}

import 'package:animore/logic/api/authentication/apiAuthentication.dart';
import 'package:animore/logic/model/modelUser.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';
import 'package:animore/ux/pages/main/navPages.dart';
import 'package:animore/ux/pages/welcome/welcomePage.dart';
import 'package:flutter/material.dart';

class Auth {
  Future<void> login(String email, String password, BuildContext context) async {
    if (await ApiAuthentication().loginEmailApiRequest(email, password, context)) {
      print("succeed");
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => NavPages()), (route) => false);
    } else {
      print("failed");
    }
  }

  Future<void> signup(String name, String email, String password,String passwordConfrim, BuildContext context) async {
    if (await ApiAuthentication().registerEmailApiRequest(name, email, password, passwordConfrim, context)) {
      print("succeed");
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => NavPages()), (route) => false);
    } else {
      print("failed");
    }
  }

  Future<bool> logout(BuildContext context) async {
    print("logging out");
    bool result = await ApiAuthentication().logoutApiRequest(context);
    print("result: $result");
    if (result)
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => WelcomePage()), (route) => false);
    return result;
  }

  ModelUser user() {
    return AuthenticationHelper().getUser();
  }
}

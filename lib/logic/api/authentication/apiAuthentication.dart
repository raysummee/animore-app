import 'dart:convert';

import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';
import 'package:animore/logic/api/base/baseHttp.dart';
import 'package:flutter/material.dart';

class ApiAuthentication {
  Future<bool> loginEmailApiRequest(String email, String password, BuildContext context) async {
    var url = Uri.parse("$host/login");

    String bodyToSend = json.encode({"email": email, "password": password});

    print(bodyToSend);

    var returnValue = await post(
      url, 
      bodyToSend, 
      context, 

      onSuccess: (map) async {
        await AuthenticationHelper().fetchUser(map);
        print("true");
        return true;
      }, 

      onUnathorized: (map) async{
        print(map['message']);
        return false;
      },
      needAuth: false
    );

    return returnValue ?? false;
  }

  Future<bool> registerEmailApiRequest(String name, String email,String password, String passwordConfirm, BuildContext context) async {
    var url = Uri.parse("$host/register");

    String bodyToSend = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirm
    });

    print(bodyToSend);

    var returnValue = await post(
      url, 
      bodyToSend, 
      context, 

      onSuccess: (map) async {
        await AuthenticationHelper().fetchUser(map);
        print("true");
        return true;
      }, 

      onUnathorized: (map) async{
        print(map['message']);
        return false;
      },
      needAuth: false
    );

    return returnValue ?? false;
  }

  Future<bool> logoutApiRequest(BuildContext context) async {
    var url = Uri.parse("$host/logout");
    
    var returnValue = await post(
      url, 
      null, 
      context, 

      onSuccess: (map) async {
        await AuthenticationHelper().deleteUser();
        print("true");
        return true;
      }, 

      onUnathorized: (map) async{
        print(map['message']);
        return false;
      },
      needAuth: false
    );

    return returnValue ?? false;
  }
}

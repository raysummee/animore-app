import 'dart:convert';

import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';
import 'package:http/http.dart' as http;

class ApiAuthentication{
  Future<bool> loginEmailApiRequest(String email, String password) async{
    var url = Uri.parse("$host/login");

    String bodyToSend = json.encode({
      "email" : email,
      "password" : password
    });

    print(bodyToSend);

    var response = await http.post(
      url,
      body: bodyToSend,
      headers: {"Content-Type": "application/json"}
    );

    print(json.decode(response.body));
    Map<String, dynamic> body =  json.decode(response.body);
    if(response.statusCode==200){
      await AuthenticationHelper().fetchUser(body);
      return true;
    }else{
      if(body.containsKey('message')){
        print(body['message']);
      }
      return false;
    }
  }
}
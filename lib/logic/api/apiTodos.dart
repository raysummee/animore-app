import 'dart:convert';

import 'package:animore/logic/Helper/todosHelper.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';
import 'package:hive/hive.dart';

import 'apiConfig.dart';
import 'package:http/http.dart' as http;

class ApiTodos{
  
  Future<void> getTodosAllRequest() async{
    const petId = 1;
    var url = Uri.parse("$host/todos/$petId");
    var jwt = await AuthenticationHelper().readToken();

    var response = await http.get(
      url,
      headers: {"Authorization":"Bearer $jwt", "Accept": "application/json"}
    );
    print(response.body);
    Map body =  json.decode(response.body);
    if(response.statusCode==200){
      await TodosHelper().fetchTodos(body);
    }else{
      if(body.containsKey('message')){
        print(body['message']);
      }
      if(response.statusCode == 401){
        //TODO add if log out remotely what to do
      }
    }
  } 
}
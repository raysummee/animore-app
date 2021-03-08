import 'dart:convert';
import 'package:animore/logic/Helper/importantEventHelper.dart';
import 'package:http/http.dart' as http;
import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';

class ApiImportantEvent{
  Future<void> getImportantEventAll() async{
    const petId = 1;
    var url = Uri.parse("$host/important_date/$petId");
    var jwt = await AuthenticationHelper().readToken();

    var response = await http.get(
      url,
      headers: {"Authorization":"Bearer $jwt", "Accept": "application/json"}
    );
    print(response.body);
    Map body =  json.decode(response.body);
    if(response.statusCode==200){
      await ImportantEventHelper().fetchImportantEvent(body);
    }else{
      if(body.containsKey('message')){
        print(body['message']);
      }
    }
  }
}
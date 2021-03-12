import 'dart:convert';

import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ApiPet{

  Future<void> getPetsApiRequest() async{
    var url = Uri.parse("$host/pet");
    var jwt = await AuthenticationHelper().readToken();
    var response = await http.get(
      url,
      headers: {"Authorization":"Bearer $jwt", "Accept": "application/json"}
    );

    print(response.body);
    Map body =  json.decode(response.body);
    if(response.statusCode==200){
      List<ModelPet> pets = (body['pet'] as List).map((e) => ModelPet.fromMap(e)).toList();
      (await Hive.openBox<ModelPet>("pet")).addAll(pets);
      print(Hive.box<ModelPet>("pet").values);
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
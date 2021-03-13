import 'dart:convert';

import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/helper/authenticationHelper.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
    }else{
      if(body.containsKey('message')){
        print(body['message']);
      }
      if(response.statusCode == 401){
        //TODO add if log out remotely what to do
      }
    }
  } 

  Future<bool> editPetsApiRequest(int index,int petId, {String name, String bread, String type, DateTime dob}) async{
    var url = Uri.parse("$host/pet/$petId");
    var jwt = await AuthenticationHelper().readToken();
    var inputBody = json.encode({
      "name": name,
      "bread": bread,
      "type": type
    });
    var response = await http.post(
      url,
      headers: {"Authorization":"Bearer $jwt", "Content-Type": "application/json", "Accept": "application/json"},
      body: inputBody
    );

    print(response.body);
    Map body =  json.decode(response.body);
    if(response.statusCode==200){
      ModelPet modelPet = ModelPet(
        id: petId, 
        name: name, 
        bread: bread, 
        dob: dob,
        image: null, 
        type: type,
      );
      (await Hive.openBox<ModelPet>("pet")).put(index, modelPet);
      return true;
    }else{
      if(body.containsKey('message')){
        print(body['message']);
      }
      if(response.statusCode == 401){
        //TODO add if log out remotely what to do
      }
      return false;
    }
  }
}
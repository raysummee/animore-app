import 'dart:convert';

import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/api/base/baseHttp.dart' as http;
import 'package:animore/logic/helper/authenticationHelper.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:hive/hive.dart';

class ApiPet{

  Future<void> getPetsApiRequest() async{
    var url = Uri.parse("$host/pet");
    http.get(
      url,
      onSuccess: (map) async{
        print("api pet");
        List<ModelPet> pets = (map['pet'] as List).map((e) => ModelPet.fromMap(e)).toList();
        (await Hive.openBox<ModelPet>("pet")).addAll(pets);
        return true;
      }
    );
  } 

  Future<bool> editPetsApiRequest(int index,int petId, {String name, String bread, String type, DateTime dob}) async{

    var url = Uri.parse("$host/pet/$petId");
    var inputBody = json.encode({
      "name": name,
      "bread": bread,
      "type": type
    });
    
    return await http.post(
      url,
      body: inputBody,
      onSuccess: (map) async{
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
      }
    );
  }
}
import 'dart:convert';

import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/api/base/baseHttp.dart' as http;
import 'package:animore/logic/helper/authenticationHelper.dart';
import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/main.dart';
import 'package:animore/ux/components/dialog/confirmDialog.dart';
import 'package:animore/ux/components/loader/indeterminateLoader.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class ApiPet{

  Future<void> all() async{
    var url = Uri.parse("$host/pet");
    await http.get(
      url,
      onSuccess: (map) async{
        return await PetHelper().fetch(map);
      }
    );
  } 

  Future<bool> add({String name, String bread, String type, DateTime dob}) async{

    var url = Uri.parse("$host/pet");
    var inputBody = json.encode({
      "name": name,
      "bread": bread,
      "type": type,
      "dob": DateFormat("MM/dd/yy").format(dob)
    });
    
    return await http.post(
      url,
      body: inputBody,
      onSuccess: (map) async{
        ModelPet pet = ModelPet.fromJson(map["pet"]);
        return await PetHelper().add(pet);
      }
    );
  }

  Future<bool> edit(int petId, {String name, String bread, String type, DateTime dob}) async{

    var url = Uri.parse("$host/pet/$petId");
    print(DateFormat("MM/dd/yy").format(dob));
    var inputBody = json.encode({
      "name": name,
      "bread": bread,
      "type": type,
      "dob": DateFormat("MM/dd/yy").format(dob)
    });
    
    return await http.post(
      url,
      body: inputBody,
      onSuccess: (map) async{
        return await PetHelper().update(petId, name, bread, type, dob);
      }
    );
  }

   Future<bool> delete(int petId, String petName) async{

    int petCount = (await PetHelper().all()).length;
    if(petCount==1) return false;

    bool confirm = await ConfirmDialog.show(
      navigatorKey.currentContext, 
      title: "Delete?", 
      content: "'$petName' pet will be deleted! Do you want to continue?", 
      positiveButtonLabel: "Delete", 
      negativeButtonLabel: "Cancel"
    );

    if(!confirm)return false;

    IndeterminateLoader.show(navigatorKey.currentContext);

    var url = Uri.parse("$host/pet/$petId");
    
    bool status =  await http.delete(
      url,
      onSuccess: (map) async{
        return await PetHelper().delete(petId);
      }
    );

    IndeterminateLoader.hide();

    return status;
  }
}
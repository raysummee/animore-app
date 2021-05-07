import 'dart:convert';
import 'package:animore/logic/Helper/importantEventHelper.dart';
import 'package:animore/logic/api/base/baseHttp.dart' as http;
import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:flutter/material.dart';
import 'package:animore/logic/api/apiConfig.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class ApiImportantEvent {
  Future<void> getImportantEventAll() async {
    //TODO replace index 0 with the index of pet which is currenty choosed
    final petId = (await PetHelper().at(0)).id;

    var url = Uri.parse("$host/important_date/$petId");

    await http.get(
      url,
      onSuccess: (map) async {
        print("success");
        await ImportantEventHelper().fetchImportantEvent(map);
        return true;
      },

    );
  }

  Future<bool> updateImportantEvent(ModelImportantEvent event, int index) async {
    //TODO replace index 0 with the index of pet which is currenty choosed
    final petId = (await PetHelper().at(0)).id;
    var url = Uri.parse("$host/important_date/$petId/${event.id}");

    var inputBody = json.encode({
        "name" : event.name,
        "date_time": DateFormat("yyyy-MM-dd HH:mm:ss").format(event.dateTime)
      });

    print(inputBody);

    return await http.put(
      url,
      body: inputBody,
      onSuccess: (map) async{
        await ImportantEventHelper().updateLocalImportantEvent(event, index);
        return true;
      }
    );
  }

  Future<bool> addNewImportantEvent(ModelImportantEvent event) async {
    //TODO replace index 0 with the index of pet which is currenty choosed
    final petId = (await PetHelper().at(0)).id;
    var url = Uri.parse("$host/important_date/$petId");

    var inputBody = json.encode({
        "name" : event.name,
        "date_time": DateFormat("yyyy-MM-dd HH:mm:ss").format(event.dateTime)
      });

    print(inputBody);

    return await http.post(
      url,
      body: inputBody,
      onSuccess: (map) async{
        await ImportantEventHelper().addIntoLocalImportantEvent(event);
        return true;
      }
    );
  }

  Future<bool> deleteImportantEvent(ModelImportantEvent event, int index) async {
    //TODO replace index 0 with the index of pet which is currenty choosed
    final petId = (await PetHelper().at(0)).id;
    var url = Uri.parse("$host/important_date/$petId/${event.id}");
    print(url);

    return await http.delete(
      url,
      onSuccess: (map) async{
        await ImportantEventHelper().deleteLocalImportantEvent(index);
        return true;
      }
    );
  }
}

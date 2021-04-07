import 'dart:convert';
import 'package:animore/logic/Helper/importantEventHelper.dart';
import 'package:animore/logic/api/base/baseHttp.dart' as http;
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:flutter/material.dart';
import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class ApiImportantEvent {
  Future<void> getImportantEventAll(BuildContext context) async {
    const petId = 1;
    var url = Uri.parse("$host/important_date/$petId");

    http.get(
      url,
      context: context,
      onSuccess: (map) async {
        print("success");
        await ImportantEventHelper().fetchImportantEvent(map);
        return true;
      },

    );
  }

  Future<bool> updateImportantEvent(BuildContext context, ModelImportantEvent event) async {
    const petId = 1;
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
        SnackBar(content: Text("Event updated"));
        return true;
      }
    );
  }
}

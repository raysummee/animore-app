import 'dart:convert';
import 'package:animore/logic/Helper/importantEventHelper.dart';
import 'package:animore/logic/api/base/baseHttp.dart' as http;
import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/main.dart';
import 'package:animore/logic/api/apiConfig.dart';
import 'package:intl/intl.dart';

class ApiImportantEvent {
  Future<void> all() async {
    final petId = PetHelper().selectedId(navigatorKey.currentContext);

    var url = Uri.parse("$host/important_date/$petId");

    await http.get(
      url,
      onSuccess: (map) async {
        print("success");
        await ImportantEventHelper().fetch(map);
        return true;
      },

    );
  }

  Future<bool> update(ModelImportantEvent event, int index) async {
    final petId = PetHelper().selectedId(navigatorKey.currentContext);
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
        await ImportantEventHelper().updateLocal(event, index);
        return true;
      }
    );
  }

  Future<bool> addNew(ModelImportantEvent event) async {
    final petId = PetHelper().selectedId(navigatorKey.currentContext);
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
        await ImportantEventHelper().addIntoLocal(event);
        return true;
      }
    );
  }

  Future<bool> delete(ModelImportantEvent event, int index) async {
    final petId = PetHelper().selectedId(navigatorKey.currentContext);
    var url = Uri.parse("$host/important_date/$petId/${event.id}");
    print(url);

    return await http.delete(
      url,
      onSuccess: (map) async{
        await ImportantEventHelper().deleteLocal(index);
        return true;
      }
    );
  }
}

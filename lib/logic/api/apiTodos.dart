
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/api/base/baseHttp.dart' as http;
import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/helper/todosHelper.dart';
import 'package:flutter/material.dart';

import 'apiConfig.dart';
class ApiTodos{
  Future<void> all() async{
    //TODO replace index 0 with the index of pet which is currenty choosed
    final petId = (await PetHelper().at(0)).id;
    var url = Uri.parse("$host/todos/$petId");
    await http.get(
      url,
      onSuccess: (map) async{
        print("api todos");
        await TodosHelper().fetchTodos(map);
        return true;
      }
    );
  } 
}

import 'dart:convert';

import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/api/base/baseHttp.dart' as http;
import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:animore/main.dart';
import 'apiConfig.dart';
class ApiTodos{
  Future<void> all({int id}) async{
    final petId = id??PetHelper().selectedId(navigatorKey.currentContext);  
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

  Future<void> addNew(ModelTodos todo, String weekName) async{
    final petId = PetHelper().selectedId(navigatorKey.currentContext);
    var url = Uri.parse("$host/todos/$petId");
    var bodyToSend = json.encode({
      "task_name": todo.name,
      "week": weekName,
      "time": DateFormat("HH:mm:ss").format(todo.time),
    });
    await http.post(
      url,
      body: bodyToSend,
      onSuccess: (map) async{
        print("added todos");
        ModelTodos todo = ModelTodos.fromMap(map['todos']);
        String upperCaseWeek = toBeginningOfSentenceCase(weekName);
        TodosHelper().add(todo, upperCaseWeek);
        return true;
      }
    );
  } 

  Future<void> update(ModelTodos todo, String weekName, int todoId) async{
    var url = Uri.parse("$host/todos/$todoId");
    var bodyToSend = json.encode({
      "task_name": todo.name,
      "week": weekName,
      "time": DateFormat("HH:mm:ss").format(todo.time),
    });
    await http.put(
      url,
      body: bodyToSend,
      onSuccess: (map) async{
        print("added todos");
        String upperCaseWeek = toBeginningOfSentenceCase(weekName);
        TodosHelper().edit(todo, upperCaseWeek);
        return true;
      }
    );
  } 

  Future<void> delete(ModelTodos todo, String weekName) async{
    var url = Uri.parse("$host/todos/${todo.id}");
    await http.delete(
      url,
      onSuccess: (map) async{
        print("added todos");
        String upperCaseWeek = toBeginningOfSentenceCase(weekName);
        TodosHelper().delete(todo, upperCaseWeek);
        return true;
      }
    );
  } 
}
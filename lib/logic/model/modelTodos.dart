import 'package:animore/logic/model/modelDoctor.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'modelTodos.g.dart';

@HiveType(typeId: 2)
class ModelTodos{
  @HiveField(0)
  int id;
  @HiveField(1)
  int done;
  @HiveField(2)
  String name;
  @HiveField(3)
  DateTime time;

  ModelTodos({
    @required this.id,
    this.done,
    @required this.time,
    @required this.name,
  });

  factory ModelTodos.fromMap(Map<String, dynamic> map){
    return ModelTodos(
      id: map.containsKey('id')?map['id']:0, 
      name: map.containsKey('task_name')?map['task_name']:"Unknown",
      time: map.containsKey('time')?DateTime.tryParse(map['time']):"",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task_name': name,
      'checked': done,
    };
  }
}
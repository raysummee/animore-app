import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'modelImportantEvent.g.dart';

@HiveType(typeId: 5)
class ModelImportantEvent{
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  DateTime dateTime;

  ModelImportantEvent({
    @required this.dateTime,
    @required this.id,
    @required this.name
  });

  factory ModelImportantEvent.fromJson(Map<String, dynamic> body){
    return ModelImportantEvent(
      dateTime: body.containsKey("date_time")?DateTime.tryParse(body['date_time']):null, 
      id: body.containsKey("id")?body['id']:null, 
      name: body.containsKey("name")?body['name']:null
    );
  }
}
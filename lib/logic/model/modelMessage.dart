import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'modelMessage.g.dart';

@HiveType(typeId: 10)
class ModelMessage{
  @HiveField(0)
  int id;
  @HiveField(1)
  String messageBody;
  @HiveField(2)
  int recepinetId;
  @HiveField(3)
  DateTime dateTime;   


  ModelMessage({
    @required this.id,
    @required this.messageBody,
    @required this.dateTime,
    @required this.recepinetId
  });
}
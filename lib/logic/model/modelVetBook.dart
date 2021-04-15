import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/model/modelUser.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'modelVetBook.g.dart';

@HiveType(typeId: 9)
class ModelVetBook{
  @HiveField(0)
  int id;
  @HiveField(1)
  DateTime onDate;
  @HiveField(2)
  ModelUser user;
  @HiveField(3)
  ModelPet pet;
  @HiveField(4)
  BookStatusEnum status; 

  ModelVetBook({
    @required this.id,
    @required this.user,
    @required this.pet,
    @required this.onDate,
    @required this.status
  });

  factory ModelVetBook.fromJson(Map<String, dynamic> body){
    return ModelVetBook(
      id: body.containsKey("id")?body['id']:0, 
      user: body.containsKey("pet")&&body['pet'].containsKey("user")? ModelUser.fromJson(body['pet']['user']):null, 
      pet: body.containsKey("pet")? ModelPet.fromJson(body['pet']):null, 
      onDate: body.containsKey("onDate")?DateTime.tryParse(body['onDate']):null,
      status: body.containsKey("status")? statusEnumFromString(body['status']):BookStatusEnum.booked
    );
  }
}
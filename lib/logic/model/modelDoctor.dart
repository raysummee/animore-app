import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'modelDoctor.g.dart';

@HiveType(typeId: 6)
class ModelDoctor{
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  bool available;
  @HiveField(4)
  String desc;
  @HiveField(5)
  int star;
  @HiveField(6)
  String location;
  @HiveField(7)
  BookStatusEnum status;

  ModelDoctor({
    @required this.id,
    @required this.name,
    @required this.star,
    @required this.location,
    @required this.desc,
    @required this.available,
    @required this.email,
    @required this.status
  });

  factory ModelDoctor.fromJson(Map<String, dynamic> map){
    return ModelDoctor(
      id: map.containsKey('id')?map['id']:0,
      name: map.containsKey("name")?map['name']:"", 
      star: map.containsKey("star")?(map['star']).toInt():0, 
      location: map.containsKey("location")?map['location']:"", 
      desc: map.containsKey("desc")?map['desc']:"",
      available: map.containsKey("avaialble")?map['available']:false,
      email: map.containsKey("email")?map['email']:"",
      status: map.containsKey("status")?statusEnumFromString(map['status']):BookStatusEnum.none
    );
  }

  
}
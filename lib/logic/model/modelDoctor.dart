import 'package:flutter/material.dart';

class ModelDoctor{
  dynamic id;
  String name;
  String email;
  bool available;
  String desc;
  int star;//
  String location;//
  ModelDoctor({
    @required this.id,
    @required this.name,
    @required this.star,
    @required this.location,
    @required this.desc,
    @required this.available,
    @required this.email
  });

  factory ModelDoctor.fromJson(Map<String, dynamic> map){
    return ModelDoctor(
      id: map.containsKey('id')?map['id']:0,
      name: map.containsKey("name")?map['name']:"", 
      star: map.containsKey("star")?(map['star']).toInt():0, 
      location: map.containsKey("location")?map['location']:"", 
      desc: map.containsKey("desc")?map['desc']:"",
      available: map.containsKey("avaialble")?map['available']:false,
      email: map.containsKey("email")?map['email']:""
    );
  }
}
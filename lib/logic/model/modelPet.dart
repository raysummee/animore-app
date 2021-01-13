import 'package:flutter/cupertino.dart';

class ModelPet{
  int id;
  String name;
  ModelPet({
    @required this.id,
    @required this.name
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'petName': name
    };
  }

  factory ModelPet.fromMap(Map<String, dynamic> map){
    return ModelPet(
      id: map.containsKey('id')?map['id']:0, 
      name: map.containsKey('petName')?map['petName']:"Error"
    );
  }
}
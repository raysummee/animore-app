import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'modelPet.g.dart';

@HiveType(typeId: 1)
class ModelPet{
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String bread;
  @HiveField(3)
  DateTime dob;
  @HiveField(4)
  String type;
  @HiveField(5)
  String image;

  ModelPet({
    @required this.id,
    @required this.name,
    @required this.bread,
    @required this.dob,
    @required this.image,
    @required this.type,
  });

  factory ModelPet.fromJson(Map<String, dynamic> body){
    return ModelPet(
      id: body.containsKey('id')?body['id']:0, 
      name: body.containsKey('name')?body['name']:"unknown",
      bread: body.containsKey("bread")?body['bread']:"unknown",
      dob: body.containsKey("dob")?DateTime.tryParse(body['dob']):null,
      image: body.containsKey("image")?body['image']:"",
      type: body.containsKey("type")?body['type']:"unknown",
    );
  }
}
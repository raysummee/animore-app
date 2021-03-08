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
  String dob;
  @HiveField(4)
  String type;
  @HiveField(5)
  String image;
  @HiveField(6)
  String userId;

  ModelPet({
    @required this.id,
    @required this.name,
    @required this.bread,
    @required this.dob,
    @required this.image,
    @required this.type,
    @required this.userId
  });

  factory ModelPet.fromMap(Map<String, dynamic> map){
    return ModelPet(
      id: map.containsKey('id')?map['id']:0, 
      name: map.containsKey('name')?map['name']:"unknown",
      bread: map.containsKey("bread")?map['bread']:"unknown",
      dob: map.containsKey("dob")?map['dob']:"",
      image: map.containsKey("image")?map['image']:"",
      type: map.containsKey("type")?map['type']:"unknown",
      userId: map.containsKey("user_id")?map['user_id'].toString():"unknown"
    );
  }
}

import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/enum/roleEnum.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'modelUser.g.dart';

@HiveType(typeId: 4)
class ModelUser{
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  RoleEnum role;
  @HiveField(4)
  String phone;
  @HiveField(5)
  DateTime dob;
  @HiveField(6)
  String image;
  @HiveField(7)
  int vetId;

  ModelUser({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.dob,
    @required this.image,
    @required this.phone,
    @required this.role,
    @required this.vetId
  });

  factory ModelUser.fromJson(Map<String, dynamic> body){
    return ModelUser(
      id: body.containsKey("id")?body['id'] as int:0,
      name: body.containsKey("name")?body['name'] as String:"User", 
      email: body.containsKey("email")?body['email'] as String:"", 
      dob: body.containsKey("dob")&&body['dob']!=null?DateTime.tryParse(body['dob']):null, 
      image: body.containsKey("image")?"$host/${body['image']}": "", 
      phone: body.containsKey("phone")&&body["phone"]!=null?body['phone'].toString(): null, 
      role: body.containsKey("role")?roleEnumFromString(body['role']): RoleEnum.basic,
      vetId: body.containsKey("veterinary_id")?body['veterinary_id'] as int: null
    );
  }
}
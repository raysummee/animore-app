
import 'package:animore/logic/api/apiConfig.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'modelUser.g.dart';

@HiveType(typeId: 4)
class ModelUser{
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String role;
  @HiveField(3)
  String phone;
  @HiveField(4)
  DateTime dob;
  @HiveField(5)
  String image;

  ModelUser({
    @required this.name,
    @required this.email,
    @required this.dob,
    @required this.image,
    @required this.phone,
    @required this.role
  });

  factory ModelUser.fromJson(Map<String, dynamic> body){
    return ModelUser(
      name: body.containsKey("name")?body['name'] as String:"User", 
      email: body.containsKey("email")?body['email'] as String:"", 
      dob: body.containsKey("dob")?DateTime.tryParse(body['dob']):null, 
      image: body.containsKey("image")?"$host/${body['image']}": "", 
      phone: body.containsKey("phone")?body['phone'].toString(): "", 
      role: body.containsKey("role")?body['role'] as String: ""
    );
  }
}
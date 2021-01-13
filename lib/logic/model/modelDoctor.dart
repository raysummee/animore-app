import 'package:flutter/material.dart';

class ModelDoctor{
  dynamic id;
  String name;
  String type;
  int star;
  String location;
  ModelDoctor({
    @required this.id,
    @required this.name,
    @required this.star,
    @required this.location,
    @required this.type
  });

  factory ModelDoctor.fromFirestore( doc){
    return ModelDoctor(
      id: doc.data.containsKey('id')?doc.data['id']:doc.documentID,
      name: doc.data.containsKey("name")?doc.data['name']:"Error", 
      star: doc.data.containsKey("star")?(doc.data['star']).toInt():0, 
      location: doc.data.containsKey("location")?doc.data['location']:"Error", 
      type: doc.data.containsKey("type")?doc.data['type']:"Error"
    );
  }
}
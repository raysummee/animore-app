import 'package:animore/logic/model/modelDoctor.dart';
import 'package:flutter/material.dart';

class ModelTodos{
  int id;
  int done;
  String name;
  String sub;
  String imageLeading;
  bool removable;
  ModelTodos({
    @required this.id,
    @required this.done,
    @required this.imageLeading,
    @required this.sub,
    @required this.name,
    @required this.removable
  });

  factory ModelTodos.fromMap(Map<String, dynamic> map){
    return ModelTodos(
      id: map.containsKey('id')?map['id']:"error", 
      done: map.containsKey('checked')?map['checked']:0, 
      imageLeading: map.containsKey('imageLeading')?map['imageLeading']:"error", 
      sub: map.containsKey('desc')?map['desc']:"error", 
      name: map.containsKey('todoName')?map['todoName']:"error",
      removable: map.containsKey('removable')&&map['removable']==1?true:false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoName': name,
      'desc': sub,
      'imageLeading': imageLeading,
      'checked': done,
      'removable': removable?1:0
    };
  }
}
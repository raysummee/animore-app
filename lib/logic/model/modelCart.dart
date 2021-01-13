import 'package:flutter/cupertino.dart';

class ModelCart{
  dynamic id;
  String name;
  String price;
  ModelCart({
    @required this.name,
    @required this.id,
    @required this.price
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price
    };
  }

  factory ModelCart.fromMap(Map<String, dynamic> map){
    print(map);
    return ModelCart(
      id: map.containsKey('id')?map['id']:"error", 
      name: map.containsKey('name')?map['name']:"error",
      price: map.containsKey('price')?map['price'].toString():"error"
    );
  }
}
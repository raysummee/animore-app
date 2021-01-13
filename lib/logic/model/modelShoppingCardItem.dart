import 'package:animore/logic/model/modelReviews.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ModelShoppingCardItem{
  String title;
  dynamic id;
  ImageProvider image;
  bool fit;
  int price;
  List<String> highlights;
  String allDetails;
  List<ModelReviews> reviewList;
  ModelShoppingCardItem({
    @required this.title,
    this.fit:false,
    @required this.id,
    @required this.allDetails,
    @required this.highlights,
    @required this.image,
    @required this.price,
    @required this.reviewList,
  });

  factory ModelShoppingCardItem.fromFireStore( doc){
    return ModelShoppingCardItem(
      fit: doc.data.containsKey("fitImage")?doc.data['fitImage']:false,
      title: doc.data.containsKey("title")?doc.data['title']: "Error", 
      id: doc.data.containsKey("id")?doc.documentID: "Error", 
      allDetails: doc.data.containsKey("all details")?doc.data['title']: "Error", 
      highlights: doc.data.containsKey("highlights")? (doc.data['highlights'] as List).map((element) => element.toString()).toList(): ["Error"], 
      image: doc.data.containsKey("imageUrl")? CachedNetworkImageProvider(doc.data['imageUrl'],) : AssetImage('lib/assets/images/puppy.jpg'), 
      price: doc.data.containsKey("price")?doc.data['price']: 0, 
      reviewList: doc.data.containsKey("reviews")?(doc.data['reviews'] as List).map((element) => ModelReviews.fromMap(element)).toList(): []
    );
  }
}
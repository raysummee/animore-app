class ModelReviews{
  double rating;
  String title;
  String details;
  ModelReviews(this.title, this.details, this.rating);
  factory ModelReviews.fromMap(Map<String, dynamic> map){
    return ModelReviews(
      map['title'], 
      map['details'], 
      (map['rating']).toDouble()
    );
  }

}
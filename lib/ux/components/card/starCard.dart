import 'package:flutter/material.dart';

class StarCard extends StatelessWidget {
  final double rating;
  StarCard(this.rating);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: rating>3.0? Colors.green.shade400: Colors.red,
      padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${rating.clamp(0, 5).toStringAsFixed(1)}",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          Icon(Icons.star, color: Colors.white, size: 18,)
        ],
      ),
    );
  }
}
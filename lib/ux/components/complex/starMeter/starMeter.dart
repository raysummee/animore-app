import 'package:flutter/material.dart';

class StarMeter extends StatelessWidget {
  final int star;
  StarMeter(this.star);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            star>0?Icons.star:Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            star>1?Icons.star:Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            star>2?Icons.star:Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            star>3?Icons.star:Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            star>4?Icons.star:Icons.star_border,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
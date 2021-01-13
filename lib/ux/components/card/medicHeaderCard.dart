import 'package:animore/ux/components/button/mediumButton.dart';
import 'package:animore/ux/components/button/MediumRoundedButton.dart';
import 'package:flutter/material.dart';

class MedicHeaderCard extends StatelessWidget {
  final String heading;
  final String subHeading;
  final ImageProvider image;
  MedicHeaderCard({
    @required this.heading,
    @required this.image,
    @required this.subHeading
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: MediaQuery.of(context).size.width-80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2)
          )
        ] 
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15)
              ),
              child: Container(
                width: 180,
                child: Image(
                  image: image
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width-180,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 3),
                child: Text(
                  heading,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width-180,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  subHeading,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: MediumRoundedButton()
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
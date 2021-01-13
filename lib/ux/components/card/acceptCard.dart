import 'package:animore/ux/components/button/smallRoundedButton.dart';
import 'package:flutter/material.dart';

class AcceptCard extends StatelessWidget {
  final String name;
  final String details;
  final bool booked;
  final String docId;
  final String collection;
  AcceptCard(this.name, this.details, this.booked, this.docId, this.collection);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                child: Text(
                  "$details",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: SmallRoundedButton(
                      booked? "Accepted" : "Accept", 
                      booked? null: (){
                        
                      }
                    )
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: SmallRoundedButton(
                      "Delete", 
                      (){
                      }
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
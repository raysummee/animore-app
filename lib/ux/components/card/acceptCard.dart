import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:animore/ux/components/button/smallRoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AcceptCard extends StatelessWidget {
  final ModelVetBook vetBook;
  AcceptCard(this.vetBook);
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
                  toBeginningOfSentenceCase(vetBook.user.name),
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                child: Text(
                  "details",
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
                      vetBook.status==BookStatusEnum.booked? "Accept" : "Accepted", 
                      vetBook.status!=BookStatusEnum.booked? null: (){
                        
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
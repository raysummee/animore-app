import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PetCard extends StatelessWidget {
  final String petName;
  final ModelImportantEvent importantEvent;
  PetCard(this.petName, this.importantEvent);

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: double.infinity,
      height: 160,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3)
          )
        ] 
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: Image(image: AssetImage("lib/assets/images/dog_person.png")),
          ),
          Container(
            width: MediaQuery.of(context).size.width-100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        petName,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Material(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            onTap: (){},
                            splashColor: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(15),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 3, 10, 2),
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, right: 8),
                  child: Text(
                    importantEvent!=null?
                      "${importantEvent.name} - ${DateFormat("dd-MMM-yy").format(importantEvent.dateTime)}"
                      :"Upcoming events will show here",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                    )
                  )
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Material(
                              color: Colors.cyan,
                              child: InkWell(
                                onTap: (){},
                                splashColor: Colors.deepOrange,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.account_circle, color: Colors.white,),
                                ),
                              ),
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Material(
                              color: Colors.cyan,
                              child: InkWell(
                                onTap: (){},
                                splashColor: Colors.deepOrange,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.add_circle, color: Colors.white,),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
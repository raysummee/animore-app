import 'dart:io';

import 'package:animore/logic/api/apiPet.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/provider/petCardEditNotify.dart';
import 'package:animore/ux/pages/main/pets/selectPetPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class PetCard extends StatelessWidget {
  final ModelPet pet;
  final ModelImportantEvent importantEvent;
  PetCard(this.pet, this.importantEvent);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetCardEditNotify>(context);
    return Container( 
      width: 800,
      height: 160,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 16),
      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2)
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
            width: MediaQuery.of(context).size.width-150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        pet.name.replaceRange(0, 1, pet.name[0].toUpperCase()),
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
                            onTap: (){
                              provider.isEditing = true;
                            },
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
                      :"Upcoming events will appear here",
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
                                onTap: (){
                                  SelectPetPage.showBottomSheet(context);
                                },
                                splashColor: Colors.deepOrange,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(FlutterIcons.pets_mdi, color: Colors.white,),
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
                                onTap: (){
                                  ApiPet().delete(pet.id, pet.name);
                                },
                                splashColor: Colors.deepOrange,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.remove_circle, color: Colors.white,),
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
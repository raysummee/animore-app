import 'dart:io';

import 'package:animore/logic/api/apiPet.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/provider/petCardEditNotify.dart';
import 'package:animore/logic/util/validator.dart';
import 'package:animore/ux/components/complex/avatar/avatarEditBig.dart';
import 'package:animore/ux/components/dialog/editEventDialog.dart';
import 'package:animore/ux/components/loader/indeterminateLoader.dart';
import 'package:animore/ux/pages/main/pets/editPetEventPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class PetAddCard extends StatefulWidget {

  @override
  _PetAddCardState createState() => _PetAddCardState();
}

class _PetAddCardState extends State<PetAddCard> {
  TextEditingController nameController;
  TextEditingController breadController;
  TextEditingController typeController;
  TextEditingController dobController;
  DateTime dob;

  @override
  void initState() {
    nameController = TextEditingController();
    breadController = TextEditingController();
    typeController = TextEditingController();
    dobController = TextEditingController();
    dobController.addListener(() {
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container( 
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 16),
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
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.cyan
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(26, 30, 26, 30),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            validator: Validator.validateNonull("Name"),
                            controller: nameController,
                            style: TextStyle(     
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Pet Name",
                            ),
                          )
                        ),
                      ),
                      SizedBox(width: 40,),
                      AvatarEditBig()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: breadController,
                          validator: Validator.validateNonull("Bread"),
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                          decoration: InputDecoration(
                            hintText: "Bread",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: typeController,
                          validator: Validator.validateNonull("Type"),
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                          decoration: InputDecoration(
                            hintText: "Type"
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    width: 170,
                    child: TextFormField(
                      controller: dobController,
                      validator: Validator.validateDate(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                      decoration: InputDecoration(
                        hintText: "Date of birth"
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: Text(
                        "Create"
                      ),
                      onPressed: () async{
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 48),
                        primary: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
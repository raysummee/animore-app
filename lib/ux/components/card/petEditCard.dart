import 'package:animore/logic/api/apiPet.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/provider/petCardEditNotify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PetEditCard extends StatelessWidget {
  final ModelPet pet;
  final int index;
  final ModelImportantEvent importantEvent;
  PetEditCard(this.pet, this.importantEvent, this.index);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetCardEditNotify>(context);
    final nameController = TextEditingController(text: pet.name.replaceRange(0, 1, pet.name[0].toUpperCase()));
    final breadController = TextEditingController(text: pet.bread.replaceRange(0, 1, pet.bread[0].toUpperCase()));
    final typeController = TextEditingController(text: pet.type.replaceRange(0, 1, pet.type[0].toUpperCase()));

    return Container( 
      height: 300,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.fromLTRB(26, 20, 0, 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3)
          )
        ] 
      ),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.cyan
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: nameController,
                                  style: TextStyle(     
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Pet Name",
                                  ),
                                )
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16,),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Material(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(15),
                                  child: InkWell(
                                    onTap: (){
                                      ApiPet().editPetsApiRequest(
                                        index,
                                        pet.id,
                                        bread: breadController.text,
                                        dob: pet.dob,
                                        type: typeController.text,
                                        name: nameController.text
                                      );
                                      provider.isEditing = false;
                                    },
                                    splashColor: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 3, 10, 2),
                                      child: Text(
                                        "Save",
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
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.cyan,
                              child: IconButton(
                                icon: Icon(FlutterIcons.date_range_mdi, color: Colors.white), 
                                onPressed: (){}
                              )
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "${DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(pet.dob).toUpperCase()}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.cyan,
                              child: IconButton(
                                icon: Icon(FlutterIcons.event_available_mdi, color: Colors.white), 
                                onPressed: (){}
                              )
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Edit Events".toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    child: Image(image: AssetImage("lib/assets/images/dog_person.png")),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: breadController,
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
                    child: TextField(
                      controller: typeController,
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
            ),
          ],
        ),
      ),
    );
  }
}
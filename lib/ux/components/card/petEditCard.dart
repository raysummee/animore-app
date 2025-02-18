
import 'package:animore/logic/api/apiPet.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/provider/petCardEditNotify.dart';
import 'package:animore/ux/pages/main/pets/editPetEventPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PetEditCard extends StatefulWidget {
  final ModelPet pet;
  final List<ModelImportantEvent> importantEvent;
  PetEditCard(this.pet, this.importantEvent);

  @override
  _PetEditCardState createState() => _PetEditCardState();
}

class _PetEditCardState extends State<PetEditCard> {
  TextEditingController nameController;
  TextEditingController breadController;
  TextEditingController typeController;
  DateTime dob;

  @override
  void initState() {
    dob = widget.pet.dob;
    nameController = TextEditingController(text: widget.pet.name.replaceRange(0, 1, widget.pet.name[0].toUpperCase()));
    breadController = TextEditingController(text: widget.pet.bread.replaceRange(0, 1, widget.pet.bread[0].toUpperCase()));
    typeController = TextEditingController(text: widget.pet.type.replaceRange(0, 1, widget.pet.type[0].toUpperCase()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetCardEditNotify>(context);

    return Container( 
      height: 335,
      width: 800,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 16),
      padding: EdgeInsets.fromLTRB(26, 20, 0, 20),
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
                            ],
                          )
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Material(
                                color: Colors.cyan,
                                child: IconButton(
                                  splashColor: Colors.deepOrange,
                                  icon: Icon(FlutterIcons.date_range_mdi, color: Colors.white), 
                                  onPressed: () async{
                                    DateTime dateTime = await showDatePicker(
                                      context: context, 
                                      initialDate: DateTime.now(), 
                                      firstDate: DateTime(1980), 
                                      lastDate: DateTime.now()
                                    );
                                    if(dateTime!=null){
                                      setState(() {
                                        dob = dateTime;
                                      });
                                    }
                                  }
                                )
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "${DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(dob).toUpperCase()}",
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Material(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.cyan,
                                child: IconButton(
                                  splashColor: Colors.deepOrange,
                                  icon: Icon(FlutterIcons.event_available_mdi, color: Colors.white), 
                                  onPressed: (){
                                    EditPetEventPage.showBottomSheet(context);
                                  }
                                )
                              ),
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
                  Expanded(
                    // height: 140,
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
                        hintText: "Breed",
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
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: ElevatedButton(
                    child: Text(
                      "Save"
                    ),
                    onPressed: () async{
                      ApiPet().edit(
                        widget.pet.id,
                        bread: breadController.text,
                        dob: dob,
                        name: nameController.text,
                        type: typeController.text
                      );
                      provider.isEditing = false;
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(80, 45),
                      primary: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  child: ElevatedButton(
                    child: Text(
                      "Discard"
                    ),
                    onPressed: (){
                      provider.isEditing = false;
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(80, 45),
                      primary: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                  ),
                ),
                SizedBox(
                  width: 22,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'dart:io';

import 'package:animore/logic/api/apiPet.dart';
import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/ux/components/button/petSelectButton.dart';
import 'package:animore/ux/components/card/petAddCard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SelectPetPage extends StatelessWidget {
  static showBottomSheet(BuildContext context){
    if(!kIsWeb&&(Platform.isIOS||Platform.isMacOS)){
      showCupertinoModalBottomSheet(
        context: context, 
        builder: (context) => SelectPetPage(),
      );
    }else{
      showMaterialModalBottomSheet(
        context: context, 
        builder: (context) => SelectPetPage(),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Select Pet",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: PetHelper().box().listenable(),
              builder: (context, Box<ModelPet> box, child) {
                return box.isNotEmpty? ListView.builder(
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade100)
                    ),
                    child: Slidable(
                      secondaryActions: box.length>1?[
                        Material(
                          color: Colors.red,
                          child: InkWell(
                            onTap: (){
                              ApiPet().delete(box.getAt(index).id, box.getAt(index).name);
                            },
                            child: Container(
                              height: 90,
                              alignment: Alignment.center,
                              child: Icon(
                                FlutterIcons.delete_mdi,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ]:null,
                      
                      actionPane: SlidableDrawerActionPane(),
                      child: PetSelectButton(
                        box.getAt(index), 
                        index,
                        FlutterIcons.pets_mdi, 
                        (){}
                      ),
                    )
                  ),
                  itemCount: box.length
                ):Container(
                  alignment: Alignment.center,
                  child: Text(
                    "No pet is avaiable"
                  ),
                );
              }
            ),
          ),
        ],
      ),

      persistentFooterButtons: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: Text("Close")
        ),
        TextButton(
          onPressed: (){
            if(!kIsWeb&&(Platform.isIOS||Platform.isMacOS)){
              showBarModalBottomSheet(
                context: context,
                builder: (context) => ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Material(child: PetAddCard(bottom: true,))
                ),
              );
            }else{
              showMaterialModalBottomSheet(
                context: context, 
                builder: (context) => Material(child: PetAddCard(bottom: true,)),
              );
            }
          }, 
          child: Text("Add New Pet")
        ),
      ],
    );
  }
}
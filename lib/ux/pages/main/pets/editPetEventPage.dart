import 'dart:io';

import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/ux/components/button/cardButton.dart';
import 'package:animore/ux/components/dialog/editEventDialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditPetEventPage extends StatelessWidget {
  static showBottomSheet(BuildContext context){
    if(!kIsWeb&&(Platform.isIOS||Platform.isMacOS)){
      showCupertinoModalBottomSheet(
        context: context, 
        builder: (context) => EditPetEventPage(),
      );
    }else{
      showMaterialModalBottomSheet(
        context: context, 
        builder: (context) => EditPetEventPage(),
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
          "Edit Event",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ModelImportantEvent>("importantEvent").listenable(),
        builder: (context, Box<ModelImportantEvent> box, child) {
          return ListView.builder(
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade100)
              ),
              child: CardButton(
                box.getAt(index).name, 
                FlutterIcons.event_sli,
                Colors.white, 
                (){
                  EditEventDialog.show(context, event: box.getAt(index), index: index);
                },
                subtitle: DateFormat("dd MMM yy").format(box.getAt(index).dateTime),
              )
            ),
            itemCount: box.length
          );
        }
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
            EditEventDialog.show(context);
          }, 
          child: Text("Add New Event")
        ),
      ],
    );
  }
}
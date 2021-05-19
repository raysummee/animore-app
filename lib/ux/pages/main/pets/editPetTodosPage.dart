import 'dart:io';

import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/provider/weekSelectNotify.dart';
import 'package:animore/ux/components/button/cardButton.dart';
import 'package:animore/ux/components/complex/customDropdown/customDropdown.dart';
import 'package:animore/ux/components/dialog/editTodosDialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class EditPetTodosPage extends StatelessWidget {
  static showBottomSheet(BuildContext context){
    if(!kIsWeb&&(Platform.isIOS||Platform.isMacOS)){
      showCupertinoModalBottomSheet(
        context: context, 
        builder: (context) => EditPetTodosPage(),
      );
    }else{
      showMaterialModalBottomSheet(
        context: context, 
        builder: (context) => EditPetTodosPage(),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeekSelectNotify>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Edit Todos",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        actions: [
          CustomDropdown([
            "mon","tue","wed","thus","fri","sat","sun"
          ])
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: TodosHelper().fromWeek(provider.weekName).listenable(),
              builder: (context, Box<ModelTodos> box, child) {
                return box.isNotEmpty? ListView.builder(
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade100)
                    ),
                    child: CardButton(
                      box.getAt(index).name, 
                      FlutterIcons.event_sli,
                      Colors.white, 
                      (){
                        EditTodosDialog.show(
                          context,
                          index: index,
                          todo: box.getAt(index),
                          weekName: provider.weekName
                        );
                      },
                      subtitle: DateFormat("HH:mm aa").format(box.getAt(index).time),
                    )
                  ),
                  itemCount: box.length
                ):Container(
                  alignment: Alignment.center,
                  child: Text(
                    "No todo is avaiable"
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
            EditTodosDialog.show(context, weekName: provider.weekName);
          }, 
          child: Text("Add New Todos")
        ),
      ],
    );
  }
}
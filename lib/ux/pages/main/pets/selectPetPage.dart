import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/provider/weekSelectNotify.dart';
import 'package:animore/ux/components/button/cardButton.dart';
import 'package:animore/ux/components/button/petSelectButton.dart';
import 'package:animore/ux/components/complex/customDropdown/customDropdown.dart';
import 'package:animore/ux/components/dialog/editTodosDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SelectPetPage extends StatelessWidget {
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
                    child: PetSelectButton(
                      box.getAt(index), 
                      index,
                      FlutterIcons.pets_mdi, 
                      (){}
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
            // EditTodosDialog.show(context, weekName: provider.weekName);
          }, 
          child: Text("Add New Pet")
        ),
      ],
    );
  }
}
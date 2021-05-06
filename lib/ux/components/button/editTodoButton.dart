import 'dart:io';

import 'package:animore/ux/pages/main/pets/editPetTodosPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditTodoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.cyan.shade100,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: (){
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
          },
          splashColor: Colors.deepOrange,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, color: Colors.black54,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Text(
                    "Edit Todos",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
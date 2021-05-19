
import 'package:animore/ux/pages/main/pets/editPetTodosPage.dart';
import 'package:flutter/material.dart';

class EditTodoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.cyan.shade100,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: (){
            EditPetTodosPage.showBottomSheet(context);
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
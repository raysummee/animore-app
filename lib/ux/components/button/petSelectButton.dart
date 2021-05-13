import 'package:animore/logic/api/apiImportantEvent.dart';
import 'package:animore/logic/api/apiTodos.dart';
import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/provider/petSelectNotify.dart';
import 'package:animore/ux/components/loader/indeterminateLoader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PetSelectButton extends StatelessWidget {
  final ModelPet pet;
  final IconData leading;
  final int index;
  final VoidCallback onLongPress;
  PetSelectButton(this.pet, this.index, this.leading ,this.onLongPress,);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PetSelectNotify>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(22, 8, 16, 8),
            leading: Icon(leading,size: 30, color: Colors.cyan),
            title: Text(pet.name),
            subtitle: Text("${pet.type}: ${pet.bread}"),
            trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  shape: BoxShape.circle, 
                  border: Border.all(color: Colors.cyan),
                  color: provider.id==pet.id? Colors.cyan : Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: provider.id==pet.id
                    ?Icon(
                      Icons.check,
                      size: 10.0,
                      color: Colors.white,
                    )
                    :Container(
                      width: 10,
                      height: 10,
                    )
                  ),
                )
              )
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async{
              if(provider.id==pet.id){
                Navigator.of(context).pop();
                return;
              }
              provider.id = pet.id;
              IndeterminateLoader.show(context);
              await ApiTodos().all();
              await ApiImportantEvent().all();
              IndeterminateLoader.hide();
              Navigator.of(context).pop();
            },
            onLongPress: onLongPress,
            child: Container(
              width: double.infinity,
              height: 90,
            ),
          ),
        )
      ],
    );
  }
}
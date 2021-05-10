import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/provider/petSelectNotify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardSelectButton extends StatelessWidget {
  final ModelPet pet;
  final IconData leading;
  final int index;
  final VoidCallback onLongPress;
  CardSelectButton(this.pet, this.index, this.leading ,this.onLongPress,);
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
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, 
                    border: Border.all(color: Colors.cyan),
                    color: provider.index==index? Colors.cyan : Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: provider.index==index
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
                  ),
              )
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              provider.index = index;
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
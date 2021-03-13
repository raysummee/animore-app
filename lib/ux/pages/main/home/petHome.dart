import 'package:animore/logic/api/apiImportantEvent.dart';
import 'package:animore/logic/api/apiPet.dart';
import 'package:animore/logic/helper/importantEventHelper.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/provider/petCardEditNotify.dart';
import 'package:animore/ux/components/card/petCard.dart';
import 'package:animore/ux/components/card/petEditCard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class PetHome extends StatefulWidget {
  @override
  _PetHomeState createState() => _PetHomeState();
}

class _PetHomeState extends State<PetHome> {
  Future<void> getAllPetHandler;
  Future<void> getAllImportantEvent;

  @override
  void initState() {
    getAllPetHandler = ApiPet().getPetsApiRequest();
    getAllImportantEvent =  ApiImportantEvent().getImportantEventAll();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetCardEditNotify>(context);
    return Container(
      child:  FutureBuilder<void>(
        future: getAllImportantEvent,
        builder: (context, snapshot) {
          return FutureBuilder<void>(
            future: getAllPetHandler,
            builder: (context, snapshotUser) {
              return ValueListenableBuilder(
                valueListenable: Hive.box<ModelPet>("pet").listenable(), 
                builder: (context, Box<ModelPet> box, child) {
                  if(box.isNotEmpty){
                    return AnimatedCrossFade(
                      firstChild: PetEditCard(
                        box.get(0), 
                        ImportantEventHelper().getRecentImportantEvent(),
                        0
                      ), 
                      secondChild: PetCard(
                        "${box.get(0).name}",
                        ImportantEventHelper().getRecentImportantEvent()
                      ), 
                      crossFadeState: provider.isEditing?CrossFadeState.showFirst:CrossFadeState.showSecond, 
                      duration: Duration(milliseconds: 300)
                    );
                  }else{
                    return PetCard("...", null);
                  }
                }
              );
            }
          );
        }
      ),
    );
  }
}
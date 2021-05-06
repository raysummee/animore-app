import 'package:animated_size_and_fade/animated_size_and_fade.dart';
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

class _PetHomeState extends State<PetHome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetCardEditNotify>(context);
    return Container(
      child: ValueListenableBuilder(
        valueListenable: Hive.box<ModelPet>("pet").listenable(),
        builder: (context, Box<ModelPet> box, child) {
          if (box.isNotEmpty) {
            return AnimatedSizeAndFade(
              vsync: this,
              child: provider.isEditing?
                PetEditCard(
                  box.get(0),
                  ImportantEventHelper().getAllImportantEvents(), 
                  0
                ):
                PetCard(
                  "${box.get(0).name}",
                  ImportantEventHelper().getRecentImportantEvent()
                ),
              fadeDuration: Duration(milliseconds: 300),
              sizeDuration: Duration(milliseconds: 300),
            );
          } else {
            return PetCard("...", null);
          }
        }
      )
    );
  }
}

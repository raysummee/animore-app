import 'package:animore/logic/model/modelMedicHeaderCard.dart';
import 'package:animore/ux/components/card/medicHeaderCard.dart';
import 'package:flutter/material.dart';

class MediicHeaderListHorizontal extends StatelessWidget {
  final List<ModelMedicHeaderCard> list = [
    ModelMedicHeaderCard(subHeading: "24/7 Support from the best in class doctors", header: "Instant Appointment with doctor", imageAsset: "lib/assets/images/doctor1.jpg"),
    ModelMedicHeaderCard(subHeading: "Chat with medical assistances", header: "Live Chats", imageAsset: "lib/assets/images/doctor2.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        itemBuilder: (context, index) {
          return MedicHeaderCard(
            heading: list.elementAt(index).header,
            subHeading: list.elementAt(index).subHeading,
            image: AssetImage(list.elementAt(index).imageAsset),
          );
        },
      ),
    );
  }
}
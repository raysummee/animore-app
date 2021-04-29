import 'package:animore/logic/model/modelVetBook.dart';
import 'package:animore/ux/components/button/mediumButton.dart';
import 'package:animore/ux/components/button/primaryRoundedButton.dart';
import 'package:animore/ux/components/button/smallRoundedButton.dart';
import 'package:animore/ux/components/group/horizontalIconAndTextGroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class VetAppointmentCard extends StatelessWidget {
  final ModelVetBook vetBook;
  VetAppointmentCard(this.vetBook);
  @override
  Widget build(BuildContext context) {
    print("image : ${vetBook.user.image}");
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Colors.black26,
      elevation: 15,
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(vetBook.user.image),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vetBook.user.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        DateFormat("dd MMM yyyy, hh:mm a").format(vetBook.onDate)
                      ),
                    ],
                  ) 
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
              ),
            ),
            HorizontalIconAndTextGroup(vetBook.user.phone, FlutterIcons.phone_faw),
            SizedBox(
              height: 8,
            ),
            HorizontalIconAndTextGroup(vetBook.subject, FlutterIcons.notes_medical_faw5s, iconColor: Colors.orange,),
          ],
        ),
      ),
    );
  }
}
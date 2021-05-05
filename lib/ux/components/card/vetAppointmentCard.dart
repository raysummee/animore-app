import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:animore/ux/components/button/mediumButton.dart';
import 'package:animore/ux/components/button/primaryRoundedButton.dart';
import 'package:animore/ux/components/button/smallRoundedButton.dart';
import 'package:animore/ux/components/group/horizontalIconAndTextGroup.dart';
import 'package:animore/ux/components/others/customCircleAvatar.dart';
import 'package:animore/ux/pages/main/doctor/messageDoctorPage.dart';
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
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.cyan,
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_)=> MessageDoctorPage(vetBook)
            )
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomCircleAvatar(image: NetworkImage(vetBook.user.image,), fallbackString: vetBook.user.name[0].toUpperCase(),),
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
                  ),
                  vetBook.status==BookStatusEnum.booked? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Container(
                          color: Colors.deepOrange,
                          width: 15,
                          height: 15,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "NEW",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ],
                  ):SizedBox.shrink()
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                ),
              ),
              HorizontalIconAndTextGroup(vetBook.user.phone??"Not avaiable", FlutterIcons.phone_faw),
              SizedBox(
                height: 8,
              ),
              HorizontalIconAndTextGroup(vetBook.subject, FlutterIcons.notes_medical_faw5s, iconColor: Colors.orange,),
            ],
          ),
        ),
      ),
    );
  }
}
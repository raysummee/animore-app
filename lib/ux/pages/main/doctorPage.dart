import 'package:animore/logic/api/apiVeterinary.dart';
import 'package:animore/logic/api/apiVeterinaryBook.dart';
import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/helper/veterinaryBookHelper.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:animore/logic/provider/vetBookSliderNotify.dart';
import 'package:animore/ux/components/card/acceptCard.dart';
import 'package:animore/ux/components/card/vetAppointmentCard.dart';
import 'package:animore/ux/components/complex/profileStatusQuick.dart';
import 'package:animore/ux/components/dialog/animalAbuseDialog.dart';
import 'package:animore/ux/components/slider/vetAppointmentSlider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VetBookSliderNotify>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2,
            color: Colors.cyan,
            alignment: Alignment.topLeft,
            child: Container(
              height: 200,
              color: Colors.cyan,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(16, 0, 32, 0),
              child: Text(
                "Medic Dashboard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ),
          SingleChildScrollView(
            child: Transform.translate(
              offset: Offset(0, 140),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
                ),
                child: Container(
                  color: Colors.white,
                  constraints: BoxConstraints(
                    minHeight: 500,
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      VetAppointmentSlider(),
                      SizedBox(
                        height: 16,
                      ),
                      provider.index==1?FutureBuilder(
                        future: ApiVeterinaryBook().getAllBookingsOfCurrentVeterinary(),
                        builder: (context, snapshot) {
                          return ValueListenableBuilder(
                            valueListenable: Hive.box<ModelVetBook>("vetBook").listenable(), 
                            builder: (context, Box<ModelVetBook> box, child) {
                              return box.isNotEmpty? ListView.builder(
                                shrinkWrap: true,
                                itemCount: box.length,
                                reverse: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(
                                  bottom: 160
                                ),
                                itemBuilder:  (context, index) {
                                  return VetAppointmentCard(box.getAt(index));
                                }
                              ):Container(
                                padding: EdgeInsets.only(top: 16),
                                child: Text("No bookings yet")
                              );
                            },
                          );
                        },
                      ):Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
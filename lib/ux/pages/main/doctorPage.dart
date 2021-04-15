import 'package:animore/logic/api/apiVeterinary.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:animore/ux/components/card/acceptCard.dart';
import 'package:animore/ux/components/complex/profileStatusQuick.dart';
import 'package:animore/ux/components/dialog/animalAbuseDialog.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class DoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      FutureBuilder(
                        future: ApiVeterinary().getAllBookingsRequest(),
                        builder: (context, snapshot) {
                          return ValueListenableBuilder(
                            valueListenable: Hive.box<ModelVetBook>("vetBook").listenable(),
                            builder: (context, Box<ModelVetBook> box, child) {
                              return ListView.builder(
                                itemCount: box.length,
                                padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 160),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => AcceptCard(box.getAt(index)),
                              );
                            }
                          );
                        }
                      )
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
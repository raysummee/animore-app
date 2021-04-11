import 'package:animore/logic/api/apiVeterinary.dart';
import 'package:animore/logic/model/modelDoctor.dart';
import 'package:animore/ux/components/card/doctorCard.dart';
import 'package:animore/ux/components/card/medicHeaderCard.dart';
import 'package:animore/ux/components/list/medicHeaderListHorizontal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HealPage extends StatelessWidget {
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
                "Medic",
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
                      MediicHeaderListHorizontal(),
                      FutureBuilder<void>(
                        future: ApiVeterinary().getAllVeterinaryRequest(),
                        builder: (context, snapshot) {
                          return ValueListenableBuilder(
                            valueListenable: Hive.box<ModelDoctor>("veterinary").listenable(),
                            builder: (context, Box<ModelDoctor> box, child) {
                              return Container(
                                child: ListView.builder(
                                  padding: EdgeInsets.fromLTRB(10, 4, 10, 140),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: box.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => DoctorCard(box.getAt(index)),
                                ),
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
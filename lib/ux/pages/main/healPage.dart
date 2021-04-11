import 'package:animore/logic/model/modelDoctor.dart';
import 'package:animore/ux/components/card/doctorCard.dart';
import 'package:animore/ux/components/card/medicHeaderCard.dart';
import 'package:animore/ux/components/list/medicHeaderListHorizontal.dart';
import 'package:flutter/material.dart';

class HealPage extends StatelessWidget {
  final List<ModelDoctor> modelDoctors = [
    ModelDoctor(
      id: 0,
      name: "Dr John Doe",
      location: "11 S Road VIP road, Guwahati, Assam",
      star: 3,
      desc: "Therapist"
    ),
    ModelDoctor(
      id: 1,
      name: "Dr Sarina Leo",
      location: "13 L Road Karbi road, Guwahati, Assam",
      star: 4,
      desc: "Medicine Specialist"
    ),
    ModelDoctor(
      id: 1,
      name: "Dr Sarina Leo",
      location: "13 L Road Karbi road, Guwahati, Assam",
      star: 4,
      desc: "Medicine Specialist"
    ),
    ModelDoctor(
      id: 1,
      name: "Dr Sarina Leo",
      location: "13 L Road Karbi road, Guwahati, Assam",
      star: 4,
      desc: "Medicine Specialist"
    ),
  ];
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
                      Container(
                        child: ListView.builder(
                          padding: EdgeInsets.fromLTRB(10, 4, 10, 140),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: modelDoctors.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => DoctorCard(modelDoctors[index]),
                        ),
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
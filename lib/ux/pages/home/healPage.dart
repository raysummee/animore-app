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
      type: "Therapist"
    ),
    ModelDoctor(
      id: 1,
      name: "Dr Sarina Leo",
      location: "13 L Road Karbi road, Guwahati, Assam",
      star: 4,
      type: "Medicine Specialist"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.more_vert), 
                      onPressed: (){}
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 40, 30, 0),
                      child: Text(
                        "Medic",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)
                      ),
                    ),
                    width: double.infinity,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 240,
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: MediicHeaderListHorizontal()
                          ),
                          StreamBuilder<int>(
                            // stream: Firestore.instance.collection("doctor").snapshots(),
                            builder: (context, snapshot) {
                              if(true)
                              {
                                return Container(
                                  constraints: BoxConstraints(
                                    minHeight: MediaQuery.of(context).size.height-kToolbarHeight-kBottomNavigationBarHeight-348,
                                  ),
                                  child: ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return DoctorCard(
                                        ModelDoctor()
                                      );
                                    },
                                  ),
                                );
                              }else{
                                return Container(
                                  height: MediaQuery.of(context).size.height-kToolbarHeight-kBottomNavigationBarHeight-348,
                                  child: Center(
                                    child: CircularProgressIndicator()
                                  ),
                                );
                              }
                            }
                          )
                        ],
                      ),
                    ),
                  ),
                )
              )
            ]
          ),
        )
      ),
    );
  }
}
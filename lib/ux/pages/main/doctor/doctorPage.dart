import 'package:animore/logic/provider/vetBookSliderNotify.dart';
import 'package:animore/ux/components/list/doctorMessageList.dart';
import 'package:flutter/material.dart';
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
                      DoctorMessagePage()
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
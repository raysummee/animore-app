import 'package:animore/logic/model/modelDoctor.dart';
import 'package:animore/ux/components/button/smallRoundedButton.dart';
import 'package:animore/ux/components/complex/starMeter/starMeter.dart';
import 'package:animore/ux/components/dialog/bookConfirm.dart';
import 'package:animore/ux/components/dialog/dialogLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final ModelDoctor modelDoctor;
  DoctorCard(this.modelDoctor);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2)
          )
        ] 
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 24, 10, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.cyan,
            ),
            alignment: Alignment.center,
            width: 50,
            height: 50,
            child: Icon(CupertinoIcons.person_solid, color: Colors.white,),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 24, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      modelDoctor.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      modelDoctor.desc,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 12,
                        ),
                        Text(
                          modelDoctor.location,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    )
                  ),
                  StarMeter(modelDoctor.star),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(),
                      SmallRoundedButton(
                        "Book",
                        ()async{
                          if(true)
                          {
                            showDialog(
                              barrierDismissible: false,
                              context: context, 
                              builder: (context) {
                                return BookConfirm(modelDoctor);
                              },
                            );
                          }else{
                            showDialog(
                              context: context,
                              builder: (context) {
                                return DialogLogin();
                              },
                            );
                          }
                        }
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}